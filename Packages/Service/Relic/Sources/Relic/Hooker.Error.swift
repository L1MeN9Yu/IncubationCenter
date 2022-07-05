//
// Created by Mengyu Li on 2022/7/5.
//

public extension Hooker {
    enum Error: Swift.Error {
        case alreadyHooked(address: Address)
        case hookNotFound(address: Address)
    }
}
