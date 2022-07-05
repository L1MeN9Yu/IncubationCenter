//
// Created by Mengyu Li on 2022/7/5.
//

import Foundation

class FunctionInlineHookRouting: InterceptRouting {
    let replaceFunction: Function

    init(hookEntry: HookEntry, replaceFunction: @escaping Function) {
        self.replaceFunction = replaceFunction
        super.init(hookEntry: hookEntry)
    }

    @discardableResult
    override func dispatchRouting() -> Self {
        buildRouting()
        return self
    }
}

private extension FunctionInlineHookRouting {
    func buildRouting() {}
}
