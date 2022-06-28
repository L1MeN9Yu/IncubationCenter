//
// Created by Mengyu Li on 2022/6/27.
//

import CenterAPI
import Foundation
import UICore

class FilterItemViewModel: ViewModel {
    let section: FilterSection

    let items: [String]

    let isMultiSelect: Bool

    init(section: FilterSection) {
        self.section = section
        switch section {
        case .categories:
            items = Categories.allCases.map(\.title)
            isMultiSelect = Categories.isMulti
        case .purity:
            items = Purity.allCases.map(\.title)
            isMultiSelect = Purity.isMulti
        case .sorting:
            items = Sorting.allCases.map(\.title)
            isMultiSelect = Sorting.isMulti
        case .order:
            items = Order.allCases.map(\.title)
            isMultiSelect = Order.isMulti
        }
        super.init()
    }
}

extension FilterItemViewModel: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(section)
    }

    public static func == (lhs: FilterItemViewModel, rhs: FilterItemViewModel) -> Bool {
        lhs.section == rhs.section
    }
}
