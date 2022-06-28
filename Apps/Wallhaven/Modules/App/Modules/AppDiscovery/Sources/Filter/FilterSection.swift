//
// Created by Mengyu Li on 2022/6/27.
//

import CenterAPI

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
            return Categories.title
        case .purity:
            return Purity.title
        case .sorting:
            return Sorting.title
        case .order:
            return Order.title
        }
    }
}
