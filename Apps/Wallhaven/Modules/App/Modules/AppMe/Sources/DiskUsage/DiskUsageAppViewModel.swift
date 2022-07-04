//
// Created by Mengyu Li on 2022/7/1.
//

import BaseUI
import Foundation
import UIExtensionsKit

class DiskUsageAppViewModel: ViewModel {
    let section = DiskUsageSection.app

    private(set) var titleText: Optional<String> = .none
    private(set) var descriptionText: Optional<String> = .none
    private(set) var valueText: Optional<String> = .none
}

extension DiskUsageAppViewModel {
    func update(diskUsageInfo: DiskUsageInfo) {
        let threshold: Double = 1024
        var size = Double(diskUsageInfo.bundle + diskUsageInfo.container)
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

        titleText = String(format: Module.localizedString(key: "DiskUsageViewController.App.Cell.Title"), "\(Bundle.main.displayName.unwrapped(or: "Wallhaven"))")

        let appPercentValue = Double(diskUsageInfo.bundle + diskUsageInfo.container) / Double(diskUsageInfo.deviceTotal)
        numberFormat.numberStyle = .percent
        let appPercentText = numberFormat.string(from: .init(value: appPercentValue)).unwrapped(or: "0%")

        descriptionText = String(format: Module.localizedString(key: "DiskUsageViewController.App.Cell.Description"), "\(appPercentText)")
    }
}

extension DiskUsageAppViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(section)
    }

    static func == (lhs: DiskUsageAppViewModel, rhs: DiskUsageAppViewModel) -> Bool {
        lhs.section == rhs.section
    }
}
