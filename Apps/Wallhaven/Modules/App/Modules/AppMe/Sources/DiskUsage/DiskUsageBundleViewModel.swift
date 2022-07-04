//
// Created by Mengyu Li on 2022/7/1.
//

import BaseUI
import ExtensionKit
import Foundation

class DiskUsageBundleViewModel: ViewModel {
    let section = DiskUsageSection.bundle
    let titleText: String = Module.localizedString(key: "DiskUsageViewController.Bundle.Cell.Title")
    let descriptionText: String = Module.localizedString(key: "DiskUsageViewController.Bundle.Cell.Description")
    private(set) var valueText: Optional<String> = .none
}

extension DiskUsageBundleViewModel {
    func update(diskUsageInfo: DiskUsageInfo) {
        let threshold: Double = 1024
        var size = Double(diskUsageInfo.bundle)
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

extension DiskUsageBundleViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(section)
    }

    static func == (lhs: DiskUsageBundleViewModel, rhs: DiskUsageBundleViewModel) -> Bool {
        lhs.section == rhs.section
    }
}
