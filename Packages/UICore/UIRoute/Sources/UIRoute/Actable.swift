//
// Created by Mengyu Li on 2022/5/29.
//

public protocol Actable {
    static func act(url: URLConvertible, values: [String: Any], context: Any?) -> Bool
    static var actName: String { get }
}

public extension Actable {
    static var actName: String { String(describing: self) }
}
