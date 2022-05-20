//
// Created by Mengyu Li on 2021/1/26.
//

public protocol Bootable {
    static var environment: Environmental { get }

    @discardableResult
    static func register(environment: Environmental) -> Self.Type

    @discardableResult
    static func bootstrap() -> Self.Type
}
