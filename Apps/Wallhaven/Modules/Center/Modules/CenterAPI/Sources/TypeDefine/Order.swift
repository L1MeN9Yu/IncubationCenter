//
// Created by Mengyu Li on 2022/6/28.
//

public enum Order {
    case desc
    case asc
}

extension Order: CaseIterable {}

public extension Order {
    static let title: String = Module.localizedString(key: "Order.Title")

    var title: String {
        switch self {
        case .desc:
            return Module.localizedString(key: "Order.Desc.Title")
        case .asc:
            return Module.localizedString(key: "Order.Asc.Title")
        }
    }
}

public extension Order {
    static let isMulti: Bool = false
}
