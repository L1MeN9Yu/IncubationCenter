//
// Created by Mengyu Li on 2022/5/20.
//

import AppModular
import LoggerPool

class AppTabBarModule: Modular {}

extension AppTabBarModule {
    static let logger = Loggers[typeName]
}

let logger = AppTabBarModule.logger
