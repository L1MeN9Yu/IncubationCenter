//
// Created by Mengyu Li on 2022/5/29.
//

import AppModular
import LoggerPool

class WebBrowserModule: Modular {}

extension WebBrowserModule {
    static let logger = Loggers[typeName]
}

let logger = WebBrowserModule.logger
