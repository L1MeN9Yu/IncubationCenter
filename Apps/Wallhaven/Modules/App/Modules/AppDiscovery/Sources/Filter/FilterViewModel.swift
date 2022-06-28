//
// Created by Mengyu Li on 2022/6/27.
//

import Foundation
import UICore

class FilterViewModel: ViewModel {
    private(set) lazy var items: [FilterSection: [FilterItemViewModel]] = [
        .categories: [
            FilterItemViewModel(section: .categories),
        ],
        .purity: [
            FilterItemViewModel(section: .purity),
        ],
        .sorting: [
            FilterItemViewModel(section: .sorting),
        ],
        .order: [
            FilterItemViewModel(section: .order),
        ],
    ]
}
