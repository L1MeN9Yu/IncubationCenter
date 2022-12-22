//
// Created by Mengyu Li on 2022/7/1.
//

import UIBase
import Foundation

class DiskUsageCacheViewModel: ViewModel {
    let section = DiskUsageSection.cache

    let titleText: String = Module.localizedString(key: "DiskUsageViewController.Cache.Cell.Title")
    let descriptionText: String = Module.localizedString(key: "DiskUsageViewController.Cache.Cell.Description")
    private(set) var valueText: Optional<String> = .none
}

extension DiskUsageCacheViewModel {
    func update(diskUsageInfo: DiskUsageInfo) {
        let threshold: Double = 1024
        var size = Double(diskUsageInfo.imageCache)
        let units: [String] = [
            "B",
            "KB",
            "MB",
            "GB",
            "TB",
        ]
        var index = 0
        repeat {
            size /= threshold
            index += 1
        } while size >= threshold

        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        numberFormat.maximumFractionDigits = 2
        valueText = numberFormat.string(from: .init(value: size)).unwrapped(or: "0") + " " + units[safe: index].unwrapped(or: "")
    }
}

extension DiskUsageCacheViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(section)
    }

    static func == (lhs: DiskUsageCacheViewModel, rhs: DiskUsageCacheViewModel) -> Bool {
        lhs.section == rhs.section
    }
}
