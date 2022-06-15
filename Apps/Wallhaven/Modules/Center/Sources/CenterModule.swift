//
// Created by Mengyu Li on 2022/5/19.
//

import Service

public enum CenterModule {}

private extension CenterModule {
    static let logger = Loggers[String(describing: CenterModule.self)]
    static let clientHandler = ClientHandler(logger: logger)
}

public extension CenterModule {
    static func bootstrap() {
        server.start()
    }
}

private extension CenterModule {
    static let server = Server(port: 9528, logger: logger, clientHandler: clientHandler)
}
