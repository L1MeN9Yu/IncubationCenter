//
// Created by Mengyu Li on 2022/6/28.
//

import AppModular
import Foundation
import LoggerPool

class APICenterModule: Modular {
    static let logger = Loggers[typeName]
}

let logger = APICenterModule.logger
