//
// Created by Mengyu Li on 2022/6/27.
//

enum FilterSection {
    case categories
    case purity
    case sorting
    case order
}

extension FilterSection: CaseIterable {}

extension FilterSection: Hashable {}

extension FilterSection {
    var localizedTitle: String {
        switch self {
        case .categories:
            return "categories"
        case .purity:
            return "purity"
        case .sorting:
            return "sorting"
        case .order:
            return "order"
        }
    }
}
