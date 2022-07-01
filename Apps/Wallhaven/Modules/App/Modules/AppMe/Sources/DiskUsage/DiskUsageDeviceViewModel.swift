//
// Created by Mengyu Li on 2022/7/1.
//

import BaseUI
import Foundation

class DiskUsageDeviceViewModel: ViewModel {
    let section = DiskUsageSection.device
}

extension DiskUsageDeviceViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(section)
    }

    static func == (lhs: DiskUsageDeviceViewModel, rhs: DiskUsageDeviceViewModel) -> Bool {
        lhs.section == rhs.section
    }
}
