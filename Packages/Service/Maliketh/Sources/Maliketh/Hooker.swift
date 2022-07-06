//
// Created by Mengyu Li on 2022/7/6.
//

import MachO.dyld

public enum Hooker {}

public extension Hooker {
    @inline(__always)
    static func hook(symbol: String, replacedFunction: UnsafeRawPointer, originalFunctionPointer: Optional<UnsafeMutablePointer<UnsafeRawPointer>>) {
        (0..<_dyld_image_count())
            .compactMap { index -> (UnsafePointer<MachHeader>, Int)? in
                guard let header = _dyld_get_image_header(index) else { return nil }
                let machHeader = header.withMemoryRebound(to: MachHeader.self, capacity: 1) { $0 }
                let slide = _dyld_get_image_vmaddr_slide(index)
                return (machHeader, slide)
            }
            .forEach {
                try? hook(image: $0.0, slide: $0.1, symbol: symbol, replacedFunction: replacedFunction, originalFunctionPointer: originalFunctionPointer)
            }
    }

    @inline(__always)
    static func hook(symbol: String, image: UnsafePointer<MachHeader>, slide: Int, replacedFunction: UnsafeRawPointer, originalFunctionPointer: Optional<UnsafeMutablePointer<UnsafeRawPointer>>) throws {
        try hook(image: image, slide: slide, symbol: symbol, replacedFunction: replacedFunction, originalFunctionPointer: originalFunctionPointer)
    }
}

private extension Hooker {
    @inline(__always)
    static func hook(image: UnsafePointer<MachHeader>, slide: Int, symbol: String, replacedFunction: UnsafeRawPointer, originalFunctionPointer: Optional<UnsafeMutablePointer<UnsafeRawPointer>>) throws {
        guard var currentLoadCommand = UnsafeMutableRawPointer(bitPattern: UInt(bitPattern: image) + UInt(MemoryLayout<MachHeader>.size)) else { throw Error.currentLoadCommand }

        struct LoadCommands {
            var linkeditLoadCommand: Optional<UnsafeMutablePointer<SegmentCommand>> = .none
            var dataLoadCommand: Optional<UnsafeMutablePointer<SegmentCommand>> = .none
            var symbolTableLoadCommand: Optional<UnsafeMutablePointer<symtab_command>> = .none
            var dynamicSymbolTableCommand: Optional<UnsafeMutablePointer<dysymtab_command>> = .none
        }

        let loadCommands = (0..<image.pointee.ncmds).reduce(into: LoadCommands()) { (loadCommands: inout LoadCommands, _: UInt32) in
            let curCmd = currentLoadCommand.assumingMemoryBound(to: SegmentCommand.self)

            if curCmd.pointee.cmd == LC_SEGMENT {
                let curCmdNameOffset = MemoryLayout.size(ofValue: curCmd.pointee.cmd) + MemoryLayout.size(ofValue: curCmd.pointee.cmdsize)
                let curCmdNamePointer = currentLoadCommand.advanced(by: curCmdNameOffset).assumingMemoryBound(to: Int8.self)
                let curCmdName = String(cString: curCmdNamePointer)
                if curCmdName == SEG_LINKEDIT {
                    loadCommands.linkeditLoadCommand = curCmd
                }
                if curCmdName == SEG_DATA || curCmdName == "__DATA_CONST" {
                    loadCommands.dataLoadCommand = curCmd
                }
            } else if curCmd.pointee.cmd == LC_SYMTAB {
                loadCommands.symbolTableLoadCommand = UnsafeMutablePointer<symtab_command>(OpaquePointer(curCmd))
            } else if curCmd.pointee.cmd == LC_DYSYMTAB {
                loadCommands.dynamicSymbolTableCommand = UnsafeMutablePointer<dysymtab_command>(OpaquePointer(curCmd))
            }

            currentLoadCommand += Int(curCmd.pointee.cmdsize)
        }

        guard let linkeditLoadCommand: UnsafeMutablePointer<SegmentCommand> = loadCommands.linkeditLoadCommand else { throw Error.linkeditLoadCommand }
        guard let dataLoadCommand: UnsafeMutablePointer<SegmentCommand> = loadCommands.dataLoadCommand else { throw Error.linkeditLoadCommand }
        guard let symbolTableLoadCommand: UnsafeMutablePointer<symtab_command> = loadCommands.symbolTableLoadCommand else { throw Error.linkeditLoadCommand }
        guard let dynamicSymbolTableCommand: UnsafeMutablePointer<dysymtab_command> = loadCommands.dynamicSymbolTableCommand else { throw Error.linkeditLoadCommand }

        let linkeditBaseOffset = slide + Int(linkeditLoadCommand.pointee.vmaddr) - Int(linkeditLoadCommand.pointee.fileoff)
        guard let symbolTable = UnsafeMutablePointer<NList>(bitPattern: linkeditBaseOffset + Int(symbolTableLoadCommand.pointee.symoff)) else { throw Error.symbolTable }
        guard let stringTable = UnsafeMutablePointer<UInt8>(bitPattern: linkeditBaseOffset + Int(symbolTableLoadCommand.pointee.stroff)) else { throw Error.stringTable }
        guard let indirectSymbolTable = UnsafeMutablePointer<UInt32>(bitPattern: linkeditBaseOffset + Int(dynamicSymbolTableCommand.pointee.indirectsymoff)) else { throw Error.indirectSymbolTable }

        for sectionIndex in 0..<dataLoadCommand.pointee.nsects {
            let currentSection = UnsafeMutableRawPointer(dataLoadCommand)
                .advanced(by: MemoryLayout<SegmentCommand>.size + MemoryLayout<Section>.size * Int(sectionIndex))
                .assumingMemoryBound(to: Section.self)

            if currentSection.pointee.flags == S_LAZY_SYMBOL_POINTERS || currentSection.pointee.flags == S_NON_LAZY_SYMBOL_POINTERS {
                try replace(
                    symbol: symbol,
                    section: currentSection,
                    symbolTable: symbolTable,
                    stringTable: stringTable,
                    indirectSymbolTable: indirectSymbolTable,
                    slide: slide,
                    replacedFunction: replacedFunction,
                    originalFunctionPointer: originalFunctionPointer
                )
            }
        }
    }

    @inline(__always)
    static func replace(
        symbol: String,
        section: UnsafeMutablePointer<Section>,
        symbolTable: UnsafeMutablePointer<NList>,
        stringTable: UnsafeMutablePointer<UInt8>,
        indirectSymbolTable: UnsafeMutablePointer<UInt32>,
        slide: Int,
        replacedFunction: UnsafeRawPointer,
        originalFunctionPointer: Optional<UnsafeMutablePointer<UnsafeRawPointer>>
    ) throws {
        let indirectSymbolVMAddress = indirectSymbolTable.advanced(by: Int(section.pointee.reserved1))
        guard let sectionVMAddress = UnsafeMutablePointer<UnsafeMutableRawPointer>(bitPattern: slide + Int(section.pointee.addr)) else { throw Error.sectionVMAddress }

        for index in 0..<Int(section.pointee.size) / MemoryLayout<UnsafeMutableRawPointer>.size {
            let currentIndirectSymbol = indirectSymbolVMAddress.advanced(by: index)
            if currentIndirectSymbol.pointee == INDIRECT_SYMBOL_ABS || currentIndirectSymbol.pointee == INDIRECT_SYMBOL_LOCAL {
                continue
            }
            let currentStringTableOffset = symbolTable.advanced(by: Int(currentIndirectSymbol.pointee)).pointee.n_un.n_strx
            let currentSymbolName = stringTable.advanced(by: Int(currentStringTableOffset + 1))

            if String(cString: currentSymbolName) == symbol {
                originalFunctionPointer.map { $0.pointee = UnsafeRawPointer(sectionVMAddress.advanced(by: index).pointee) }
                sectionVMAddress.advanced(by: index).initialize(to: UnsafeMutableRawPointer(mutating: replacedFunction))
                break
            }
        }
    }
}
