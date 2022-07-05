//
// Created by Mengyu Li on 2022/5/19.
//

import Service

public enum CenterModule {}

private extension CenterModule {
    static let logger = Loggers[String(describing: CenterModule.self)]
}

public extension CenterModule {
    static func bootstrap() {
        APICenter.bootstrap()
        WebServerCenter.bootstrap()
    }
}
