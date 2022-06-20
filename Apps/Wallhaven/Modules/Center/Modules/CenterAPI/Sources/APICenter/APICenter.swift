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
    static let eventGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    static let client: Client = .init(eventLoopGroupProvider: .shared(eventGroup), logger: logger)
}

public extension APICenter {
    static func loadList(page: UInt) async throws -> ListResponse {
        let listRequest = ListRequest(page: page)
        let response = try await client.execute(request: listRequest)
        let listResponse: ListResponse = try JSONCoder.decode(data: response.body)
        return listResponse
    }

    static func loadDetail(id: String) async throws -> DetailResponse {
        let detailRequest = DetailRequest(id: id)
        let response = try await client.execute(request: detailRequest)
        let detailResponse: DetailResponse = try JSONCoder.decode(data: response.body)
        return detailResponse
    }

    static func loadSettings(apikey: String) async throws -> SettingsResponse {
        let settingsRequest = SettingsRequest(apikey: apikey)
        let response = try await client.execute(request: settingsRequest)
        let settingsResponse: SettingsResponse = try JSONCoder.decode(data: response.body)
        return settingsResponse
    }
}
