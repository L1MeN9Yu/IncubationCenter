//
// Created by Mengyu Li on 2022/7/1.
//

import BaseUI
import Foundation

class DiskUsageAppViewModel: ViewModel {
    let section = DiskUsageSection.app
}

extension DiskUsageAppViewModel {
    func update(diskUsageInfo: DiskUsageInfo) {}
}

extension DiskUsageAppViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(section)
    }

    static func == (lhs: DiskUsageAppViewModel, rhs: DiskUsageAppViewModel) -> Bool {
        lhs.section == rhs.section
    }
}
