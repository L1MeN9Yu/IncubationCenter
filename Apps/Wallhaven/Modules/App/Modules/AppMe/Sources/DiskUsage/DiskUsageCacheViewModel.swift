//
// Created by Mengyu Li on 2022/7/1.
//

import BaseUI
import Foundation

class DiskUsageCacheViewModel: ViewModel {
    let section = DiskUsageSection.cache

    let titleText: String = Module.localizedString(key: "DiskUsageViewController.Cache.Cell.Title")
    let descriptionText: String = Module.localizedString(key: "DiskUsageViewController.Cache.Cell.Description")
    private(set) var valueText: Optional<String> = .none
}

extension DiskUsageCacheViewModel {
    func update(diskUsageInfo: DiskUsageInfo) {}
}

extension DiskUsageCacheViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(section)
    }

    static func == (lhs: DiskUsageCacheViewModel, rhs: DiskUsageCacheViewModel) -> Bool {
        lhs.section == rhs.section
    }
}
