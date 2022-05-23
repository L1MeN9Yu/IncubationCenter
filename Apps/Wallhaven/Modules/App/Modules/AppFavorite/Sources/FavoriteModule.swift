//
// Created by Mengyu Li on 2022/5/23.
//

import AppModular
import LoggerPool

class FavoriteModule: Modular {}

extension FavoriteModule {
    static let logger = Loggers[typeName]
}

let logger = FavoriteModule.logger
