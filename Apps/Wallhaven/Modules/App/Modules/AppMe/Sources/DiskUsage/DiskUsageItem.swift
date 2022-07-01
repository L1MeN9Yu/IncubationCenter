//
// Created by Mengyu Li on 2022/7/1.
//

enum DiskUsageItem {
    case device(viewModel: DiskUsageDeviceViewModel)
    case app(viewModel: DiskUsageAppViewModel)
    case cache(viewModel: DiskUsageCacheViewModel)
    case bundle(viewModel: DiskUsageBundleViewModel)
}

extension DiskUsageItem: Hashable {}
