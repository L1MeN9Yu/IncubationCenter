//
// Created by Mengyu Li on 2022/6/27.
//

import BaseUI
import CenterAPI
import Foundation

class FilterItemViewModel: ViewModel {
    let section: FilterSection

    private(set) var items: [(String, Bool)]

    let isMultiSelect: Bool

    init(section: FilterSection) {
        self.section = section
        switch section {
        case .categories:
            items = Categories.allCases.map { ($0.title, false) }
            isMultiSelect = Categories.isMulti
        case .purity:
            items = Purity.allCases.map { ($0.title, false) }
            isMultiSelect = Purity.isMulti
        case .sorting:
            items = Sorting.allCases.map { ($0.title, false) }
            isMultiSelect = Sorting.isMulti
        case .order:
            items = Order.allCases.map { ($0.title, false) }
            isMultiSelect = Order.isMulti
        }
        super.init()
    }
}

extension FilterItemViewModel {
    func update(filter: Filter) {
        switch section {
        case .categories:
            items = items.map { name, selected in
                if (filter.categories.contains { categories in categories.title == name }) {
                    return (name, !selected)
                }
                return (name, selected)
            }
        case .purity:
            items = items.map { name, selected in
                if (filter.purity.contains { purity in purity.title == name }) {
                    return (name, !selected)
                }
                return (name, selected)
            }
        case .sorting:
            items = items.map { name, selected in
                if filter.sorting.title == name {
                    return (name, !selected)
                }
                return (name, selected)
            }
        case .order:
            items = items.map { name, selected in
                if filter.order.title == name {
                    return (name, !selected)
                }
                return (name, selected)
            }
        }
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
