//
// Created by Mengyu Li on 2022/6/20.
//

import Coder
import RestfulClient

extension APICenter {
    static let eventGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    static let client: Client = .init(eventLoopGroupProvider: .shared(eventGroup), logger: logger)
}

public extension APICenter {
    static func loadList(page: UInt) async throws -> ListResponse {
        let listRequest = ListRequest(page: page, categories: filter.categories, purity: filter.purity, sorting: filter.sorting, order: filter.order)
        let response = try await client.execute(request: listRequest)
        guard response.status == .ok else { throw HTTPError(httpResponseStatus: response.status) }
        let listResponse: ListResponse = try JSONCoder.decode(data: response.body)
        return listResponse
    }

    static func loadDetail(id: String) async throws -> DetailResponse {
        let detailRequest = DetailRequest(id: id)
        let response = try await client.execute(request: detailRequest)
        guard response.status == .ok else { throw HTTPError(httpResponseStatus: response.status) }
        let detailResponse: DetailResponse = try JSONCoder.decode(data: response.body)
        return detailResponse
    }

    static func loadSettings(apikey: String) async throws -> SettingsResponse {
        let settingsRequest = SettingsRequest(apikey: apikey)
        let response = try await client.execute(request: settingsRequest)
        guard response.status == .ok else { throw HTTPError(httpResponseStatus: response.status) }
        let settingsResponse: SettingsResponse = try JSONCoder.decode(data: response.body)
        return settingsResponse
    }
}
