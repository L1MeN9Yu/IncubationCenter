//
// Created by Mengyu Li on 2022/5/22.
//

import Foundation
import KeyValueStore
import Service

public enum APICenter {}

extension APICenter: TypeNameable {}

public extension APICenter {
    static func bootstrap() {
        bootstrapAPIKey()
    }
}

extension APICenter {
    static let container: Container = {
        do {
            let containerDirectoryURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("KeyValueStores")
            let containerURL = containerDirectoryURL.appendingPathComponent(typeName)
            if !FileManager.default.fileExists(atPath: containerURL.path) {
                try FileManager.default.createDirectory(at: containerURL, withIntermediateDirectories: true)
            }
            let container = try Container(path: containerURL.path, maxStore: 256)
            return container
        } catch {
            fatalError("\(error)")
        }
    }()
}
