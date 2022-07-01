//
// Created by Mengyu Li on 2022/7/1.
//

import BaseUI
import Foundation

class DiskUsageBundleViewModel: ViewModel {
    let section = DiskUsageSection.bundle
}

extension DiskUsageBundleViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(section)
    }

    static func == (lhs: DiskUsageBundleViewModel, rhs: DiskUsageBundleViewModel) -> Bool {
        lhs.section == rhs.section
    }
}
