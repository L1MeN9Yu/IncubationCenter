//
// Created by Mengyu Li on 2022/6/28.
//

public enum Order {
    case descending
    case ascending
}

extension Order: CaseIterable {}

extension Order: Codable {}

public extension Order {
    static let title: String = Module.localizedString(key: "Order.Title")

    var title: String {
        switch self {
        case .descending:
            return Module.localizedString(key: "Order.Desc.Title")
        case .ascending:
            return Module.localizedString(key: "Order.Asc.Title")
        }
    }
}

public extension Order {
    static let isMulti: Bool = false
}

extension Order {
    var queryValue: String {
        switch self {
        case .descending: return "desc"
        case .ascending: return "asc"
        }
    }
}
