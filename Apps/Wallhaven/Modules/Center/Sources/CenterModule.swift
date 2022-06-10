//
// Created by Mengyu Li on 2022/5/19.
//

import Service

public enum CenterModule {}

public extension CenterModule {
    static func bootstrap() {
        server.start()
    }
}

private extension CenterModule {
    static let server = Server(port: 9527)
}
