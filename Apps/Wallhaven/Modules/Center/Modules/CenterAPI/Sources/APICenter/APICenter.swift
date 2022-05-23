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

public extension APICenter {
    static func loadList() async throws -> ListResponse {
        let listRequest = ListRequest()
        let response = try await client.execute(request: listRequest)
        let listResponse: ListResponse = try JSONCoder.decode(data: response.body)
        return listResponse
    }
}
