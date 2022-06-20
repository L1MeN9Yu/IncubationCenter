//
// Created by Mengyu Li on 2022/5/22.
//

import Foundation
import RestfulClient

protocol BaseRequestable: Requestable {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

extension BaseRequestable {
    var scheme: String { "https" }
    var host: String { "wallhaven.cc" }
    var queryItems: [URLQueryItem]? { nil }

    public var url: String {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems

        let url: String = components.string.unsafelyUnwrapped
        return url
    }

    public var method: HTTPMethod { .GET }

    public var headers: HTTPHeaders {
        switch APICenter.apikey {
        case .none: return [:]
        case let .some(apiKey): return ["X-API-Key": apiKey]
        }
    }

    public var body: [UInt8]? { nil }
}
