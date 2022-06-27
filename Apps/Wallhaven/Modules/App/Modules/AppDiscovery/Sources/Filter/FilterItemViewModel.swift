//
// Created by Mengyu Li on 2022/6/27.
//

import Foundation
import UICore

class FilterItemViewModel: ViewModel {
    let section: FilterSection

    init(section: FilterSection) {
        self.section = section
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
