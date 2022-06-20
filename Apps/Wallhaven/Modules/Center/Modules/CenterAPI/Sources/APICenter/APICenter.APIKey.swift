//
// Created by Mengyu Li on 2022/6/20.
//

import Dispatch
import Foundation
import KeyValueStore

public extension APICenter {
    private(set) static var apikey: String?
}

extension APICenter {
    static func bootstrapAPIKey() {
        DispatchQueue(label: "Bootstrap").sync {
            do {
                apikey = try store.sync.get(key: key)
            } catch {
                logger.error("\(error)")
            }
        }
    }
}

private extension APICenter {
    static let name = typeName + ".apikey"
    static let key = "API_KEY"
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
    static func setAPIKey(_ apikey: String) {
        self.apikey = apikey

        store.async.put(key: key, value: apikey) { result in
            switch result {
            case .success: logger.info("set apikey \(apikey) success")
            case let .failure(error): logger.error("\(error)")
            }
        }
    }

    static func resetAPIKey() {
        apikey = .none

        store.async.delete(key: key) { result in
            switch result {
            case .success: logger.info("reset apikey success")
            case let .failure(error): logger.error("\(error)")
            }
        }
    }
}
