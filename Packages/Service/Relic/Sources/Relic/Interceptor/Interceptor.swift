//
// Created by Mengyu Li on 2022/7/5.
//

import Foundation

class Interceptor {
    private lazy var entries: [HookEntry] = .init()
}

extension Interceptor {
    func containsHookEntry(address: Address) -> Bool {
        entries.contains { $0.patchedAddress == address }
    }

    func findHookEntry(address: Address) -> Optional<HookEntry> {
        entries.first { $0.patchedAddress == address }
    }

    func removeHookEntry(address: Address) {
        entries.removeAll { $0.patchedAddress == address }
    }

    func addHookEntry(_ hookEntry: HookEntry) {
        entries.append(hookEntry)
    }
}

extension Interceptor {
    var count: Int {
        entries.count
    }
}
