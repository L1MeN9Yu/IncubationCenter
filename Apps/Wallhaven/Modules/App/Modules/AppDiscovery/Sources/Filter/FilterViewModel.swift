//
// Created by Mengyu Li on 2022/6/27.
//

import Foundation
import OrderedCollections
import UICore

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
