//
// Created by Mengyu Li on 2022/5/29.
//

import AppModular
import LoggerPool

class WallpaperModule: Modular {}

extension WallpaperModule {
    static let logger = Loggers[typeName]
}

let logger = WallpaperModule.logger
