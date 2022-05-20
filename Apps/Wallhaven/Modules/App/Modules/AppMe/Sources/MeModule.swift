//
// Created by Mengyu Li on 2022/5/20.
//

import AppModular
import LoggerPool

class MeModule: Modular {}

extension MeModule {
    static let logger = Loggers[typeName]
}

let logger = MeModule.logger
