//
// Created by Mengyu Li on 2022/6/27.
//

import UIBase
import CenterAPI
import Foundation
import OrderedCollections

class FilterViewModel: ViewModel {
    private(set) lazy var items: OrderedDictionary<FilterSection, [FilterItemViewModel]> = [
        FilterSection.categories: [
            FilterItemViewModel(section: .categories),
        ],
        FilterSection.purity: [
            FilterItemViewModel(section: .purity),
        ],
        FilterSection.sorting: [
            FilterItemViewModel(section: .sorting),
        ],
        FilterSection.order: [
            FilterItemViewModel(section: .order),
        ],
    ]
}

extension FilterViewModel {
    func updateFilter(_ filter: CenterAPI.Filter) {
        items.forEach { _, value in
            value.forEach { $0.update(filter: filter) }
        }
    }

    func exportFilter() -> CenterAPI.Filter {
        let categories: [Categories] = {
            switch items[.categories]?.first {
            case .none:
                return Categories.allCases
            case let .some(categoriesViewModel):
                let items: [String] = categoriesViewModel.items.filter { _, selected in selected }.map(\.0)
                let categories = Categories.allCases.filter {
                    items.contains($0.title)
                }
                return categories
            }
        }()

        let purity: [Purity] = {
            switch items[.purity]?.first {
            case .none:
                return Purity.allCases
            case let .some(purityViewModel):
                let items: [String] = purityViewModel.items.filter { _, selected in selected }.map(\.0)
                let purity = Purity.allCases.filter {
                    items.contains($0.title)
                }
                return purity
            }
        }()

        let sorting: Sorting = {
            let `default` = Sorting.dateAdded
            switch items[.sorting]?.first {
            case .none:
                return `default`
            case let .some(sortingViewModel):
                let items: [String] = sortingViewModel.items.filter { _, selected in selected }.map(\.0)
                let sorting = Sorting.allCases.first {
                    items.contains($0.title)
                }
                return sorting.unwrapped(or: `default`)
            }
        }()

        let order: Order = {
            let `default` = Order.descending
            switch items[.order]?.first {
            case .none:
                return `default`
            case let .some(orderViewModel):
                let items: [String] = orderViewModel.items.filter { _, selected in selected }.map(\.0)
                let order = Order.allCases.first {
                    items.contains($0.title)
                }
                return order.unwrapped(or: `default`)
            }
        }()

        let filter = Filter(categories: categories, purity: purity, sorting: sorting, order: order)
        logger.info("\(filter)")
        return filter
    }
}
