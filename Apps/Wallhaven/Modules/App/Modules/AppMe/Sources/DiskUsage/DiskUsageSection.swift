//
// Created by Mengyu Li on 2022/7/1.
//

enum DiskUsageSection {
    case device
    case app
    case cache
    case bundle
}

extension DiskUsageSection: Hashable {}
