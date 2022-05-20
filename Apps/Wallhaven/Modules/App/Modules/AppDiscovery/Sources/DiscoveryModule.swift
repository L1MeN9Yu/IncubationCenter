//
// Created by Mengyu Li on 2022/5/20.
//

import AppModular
import LoggerPool

class DiscoveryModule: Modular {}

extension DiscoveryModule {
    static let logger = Loggers[typeName]
}

let logger = DiscoveryModule.logger
