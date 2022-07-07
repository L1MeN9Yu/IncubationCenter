//
// Created by Mengyu Li on 2022/7/6.
//

public extension Hooker {
    enum Error: Swift.Error {
        case currentLoadCommand
        case linkeditLoadCommand
        case dataLoadCommand
        case symtabLoadCommand
        case dynamicSymtabLoadCommand
        case symbolTable
        case stringTable
        case indirectSymbolTable
        case sectionVMAddress
    }
}
