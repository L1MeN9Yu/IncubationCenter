//
// Created by Mengyu Li on 2022/6/30.
//

import BaseUI
import Darwin
import Foundation
import Kingfisher

class DiskUsageProvider: Provider {}

extension DiskUsageProvider {
    func loadDiskUsageInfo() async throws -> DiskUsageInfo {
        try await Task {
            let totalStatfsPointer = UnsafeMutablePointer<statfs>.allocate(capacity: MemoryLayout<statfs>.stride)
            defer { totalStatfsPointer.deallocate() }
            let statfsCode = statfs("/var", totalStatfsPointer)
            guard statfsCode == 0 else {
                throw DiskUsageError.statfs(code: Int(statfsCode))
            }

            let total = UInt64(totalStatfsPointer.pointee.f_bsize) * totalStatfsPointer.pointee.f_blocks
            let available = UInt64(totalStatfsPointer.pointee.f_bsize) * totalStatfsPointer.pointee.f_bavail

            let bundleURL = Bundle.main.bundleURL
            let containerURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("../").standardized

            let bundleSize = try size(of: bundleURL)
            let containerSize = try size(of: containerURL)

            let imageCache = try size(of: KingfisherManager.shared.cache.diskStorage.directoryURL)

            return DiskUsageInfo(deviceTotal: total, deviceAvailable: available, bundle: bundleSize, container: containerSize, imageCache: imageCache)
        }
        .value
    }
}

private extension DiskUsageProvider {
    func size(of url: URL) throws -> UInt64 {
        let contents = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
        return try contents.reduce(into: UInt64(0)) { (result: inout UInt64, url: URL) in
            let attributes = try FileManager.default.attributesOfItem(atPath: url.path)
            guard let fileType = attributes[.type] as? FileAttributeType else { return }
            switch fileType {
            case FileAttributeType.typeDirectory:
                result += try size(of: url)
            default:
                let size = attributes[.size] as? UInt64
                result += size.unwrapped(or: 0)
            }
        }
    }
}
