//
// Created by Mengyu Li on 2022/6/30.
//

import BaseUI
import Foundation
import SwiftKit

class DiskUsageViewModel: ViewModel {
    private(set) lazy var items: OrderedDictionary<DiskUsageSection, [DiskUsageItem]> = [
        DiskUsageSection.device: [
            DiskUsageItem.device(viewModel: DiskUsageDeviceViewModel()),
        ],
        DiskUsageSection.app: [
            DiskUsageItem.app(viewModel: DiskUsageAppViewModel()),
        ],
        DiskUsageSection.image: [
            DiskUsageItem.image(viewModel: DiskUsageImageViewModel()),
        ],
        DiskUsageSection.bundle: [
            DiskUsageItem.bundle(viewModel: DiskUsageBundleViewModel()),
        ],
    ]
}

extension DiskUsageViewModel {
    func update(diskUsageInfo: DiskUsageInfo) {
        items.forEach { _, items in
            items.forEach { item in
                switch item {
                case let .device(viewModel):
                    viewModel.update(diskUsageInfo: diskUsageInfo)
                case let .app(viewModel):
                    viewModel.update(diskUsageInfo: diskUsageInfo)
                case let .image(viewModel):
                    viewModel.update(diskUsageInfo: diskUsageInfo)
                case let .bundle(viewModel):
                    viewModel.update(diskUsageInfo: diskUsageInfo)
                }
            }
        }
    }
}
