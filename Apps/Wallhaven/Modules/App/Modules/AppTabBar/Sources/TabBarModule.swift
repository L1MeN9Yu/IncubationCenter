//
// Created by Mengyu Li on 2022/5/20.
//

import AppModular
import LoggerPool

class TabBarModule: Modular {}

extension TabBarModule {
    static let logger = Loggers[typeName]
}

typealias Module = TabBarModule

let logger = Module.logger
