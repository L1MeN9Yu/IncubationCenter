//
// Created by Mengyu Li on 2022/6/27.
//

enum FilterSection {
    case categories
    case purity
    case sorting
    case order
}

extension FilterSection: Hashable {}
