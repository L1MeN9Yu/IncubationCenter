//
// Created by Mengyu Li on 2022/7/1.
//

import BaseUI
import Foundation

class DiskUsageImageViewModel: ViewModel {
    let section = DiskUsageSection.image
}

extension DiskUsageImageViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(section)
    }

    static func == (lhs: DiskUsageImageViewModel, rhs: DiskUsageImageViewModel) -> Bool {
        lhs.section == rhs.section
    }
}
