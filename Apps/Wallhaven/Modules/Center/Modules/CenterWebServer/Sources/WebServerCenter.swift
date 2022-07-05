//
// Created by Mengyu Li on 2022/7/5.
//

import AppModular
import Foundation
import LoggerPool
import ProxyServer

public enum WebServerCenter {}

extension WebServerCenter: TypeNameable {}

extension WebServerCenter {
    static let logger = Loggers[typeName]
}

private extension WebServerCenter {
    static let clientHandler = ClientHandler(logger: logger)
    static let server = Server(port: 9528, logger: logger, clientHandler: clientHandler)
}

public extension WebServerCenter {
    static func bootstrap() {
        server.start()
    }
}
