//
// Created by Mengyu Li on 2022/5/22.
//

import RestfulClient
import Service

public enum APICenter {}

extension APICenter: TypeNameable {}

public extension APICenter {
    private(set) static var apiKey: String?
}

extension APICenter {
    static let logger = Loggers[typeName]
    static let client: Client = .init(logger: logger)
}
