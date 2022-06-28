//
// Created by Mengyu Li on 2022/6/28.
//

import Dispatch
import Foundation
import KeyValueStore

public extension APICenter {
    private(set) static var filter: Filter = .default
}

extension APICenter {
    static func bootstrapFilter() {
        DispatchQueue(label: "Bootstrap").sync {
            do {
                try store.sync.get(key: key).map {
                    filter = $0
                }
            } catch {
                logger.error("\(error)")
            }
        }
    }
}

private extension APICenter {
    static let name = typeName + ".filter"
    static let key = "FILTER"
    static let store: Store = {
        do {
            let store = try container[name]()
            return store
        } catch {
            fatalError("\(error)")
        }
    }()
}

public extension APICenter {
    static func setFilter(_ filter: Filter) {
        store.async.put(key: key, value: filter) { result in
            switch result {
            case .success: logger.info("set filter \(filter) success")
            case let .failure(error): logger.error("\(error)")
            }
        }
    }
}
