//
// Created by Mengyu Li on 2022/7/5.
//

class HookEntry {
    let id: Int
    let type: HookEntryType

    let patchedAddress: Hooker.Address

    private(set) var patchedSize: UInt32 = 0

    private(set) var relocatedAddress: Hooker.Address = 0
    private(set) var relocatedSize: UInt32 = 0

    init(id: Int, type: HookEntryType, patchedAddress: Hooker.Address) {
        self.id = id
        self.type = type
        self.patchedAddress = patchedAddress
    }
}

extension HookEntry: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension HookEntry: Equatable {
    static func == (lhs: HookEntry, rhs: HookEntry) -> Bool {
        lhs.id == rhs.id
    }
}
