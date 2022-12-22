//
// Created by Mengyu Li on 2022/6/29.
//

import AppModular
import LoggerPool
import ExtensionKit

typealias Module = BootstrapModule

let logger = Module.logger

class BootstrapModule: Modular {}

extension BootstrapModule {
    static let logger = Loggers[typeName]
}

extension BootstrapModule {
    static var bootComplete: Optional<BootComplete> = .none
}

extension BootstrapModule {
    static func boot() -> Result<Void, Error> {
        return .success
    }
}
