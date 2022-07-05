//
// Created by Mengyu Li on 2022/7/5.
//

public extension Hooker {
    typealias Address = UInt
    typealias Address32 = UInt32
    typealias Address64 = UInt64
    typealias Function = @convention(c) () -> Void
    typealias ASMFunction = @convention(c) () -> Void
}
