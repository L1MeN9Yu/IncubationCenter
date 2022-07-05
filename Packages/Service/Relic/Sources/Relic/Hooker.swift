//
// Created by Mengyu Li on 2022/7/5.
//

public enum Hooker {}

private extension Hooker {
    static let interceptor = Interceptor()
}

public extension Hooker {
    static func hook(pointer: UnsafeMutableRawPointer, replaceFunction: @escaping Function, originFunctionPointer: Optional<UnsafeMutablePointer<Function>>) throws {
        let address = Address(bitPattern: pointer)
        guard interceptor.containsHookEntry(address: address) else {
            throw Error.alreadyHooked(address: address)
        }
        let entry = HookEntry(id: interceptor.count, type: .functionInlineHook, patchedAddress: address)

        let routing = FunctionInlineHookRouting(hookEntry: entry, replaceFunction: replaceFunction)
        routing.prepare().dispatchRouting()

        originFunctionPointer.map {
            $0.pointee = unsafeBitCast(entry.relocatedAddress, to: Function.self)
        }

        routing.commit()

        interceptor.addHookEntry(entry)
    }

    static func unhook(pointer: UnsafeMutableRawPointer) throws {
        let address = Address(bitPattern: pointer)
        guard let entry: HookEntry = interceptor.findHookEntry(address: address) else {
            throw Error.hookNotFound(address: address)
        }
        interceptor.removeHookEntry(address: entry.patchedAddress)
    }
}
