//
// Created by Mengyu Li on 2022/5/21.
//

import AsyncHTTPClient
import Foundation

public class Configuration {
    public init() {}
}

extension Configuration {
    func export() -> HTTPClient.Configuration {
        HTTPClient.Configuration(
            tlsConfiguration: .makeClientConfiguration(),
            redirectConfiguration: .follow(max: 5, allowCycles: false),
            timeout: .init(connect: .seconds(5), read: .seconds(5)),
            connectionPool: HTTPClient.Configuration.ConnectionPool(),
            proxy: nil,
            decompression: .enabled(limit: .size(10 * 1024 * 1024))
        )
    }
}
