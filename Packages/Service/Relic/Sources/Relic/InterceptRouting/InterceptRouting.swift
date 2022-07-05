//
// Created by Mengyu Li on 2022/7/5.
//

class InterceptRouting {
    let hookEntry: HookEntry

    init(hookEntry: HookEntry) {
        self.hookEntry = hookEntry
    }

    @discardableResult
    func dispatchRouting() -> Self { self }

    @discardableResult
    func prepare() -> Self { self }

    @discardableResult
    func active() -> Self {
        self
    }
}

extension InterceptRouting {
    func commit() {
        active()
    }

    func generateRelocatedCode() -> Bool {
        true
    }
}

extension InterceptRouting {
    typealias Function = Hooker.Function
}
