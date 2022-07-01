//
// Created by Mengyu Li on 2022/5/20.
//

import AppModular
import LoggerPool

typealias Module = MeModule

let logger = Module.logger

class MeModule: Modular {}

extension MeModule {
    static let logger = Loggers[typeName]
}
