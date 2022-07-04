//
// Created by Mengyu Li on 2022/7/1.
//

import BaseUI
import Foundation

class DiskUsageDeviceViewModel: ViewModel {
    let section = DiskUsageSection.device

    private(set) var usedPercent: Double = 0
    private(set) var appPercent: Double = 0
}

extension DiskUsageDeviceViewModel {
    func update(diskUsageInfo: DiskUsageInfo) {
        if diskUsageInfo.deviceTotal > 0 {
            usedPercent = Double(diskUsageInfo.deviceTotal - diskUsageInfo.deviceAvailable) / Double(diskUsageInfo.deviceTotal)
            appPercent = Double(diskUsageInfo.bundle + diskUsageInfo.container) / Double(diskUsageInfo.deviceTotal)
        }
    }
}

extension DiskUsageDeviceViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(section)
    }

    static func == (lhs: DiskUsageDeviceViewModel, rhs: DiskUsageDeviceViewModel) -> Bool {
        lhs.section == rhs.section
    }
}
