//
// Created by Mengyu Li on 2022/5/22.
//

import Foundation
import RestfulClient

protocol BaseRequestable: Requestable {
    var path: String { get }
}

extension BaseRequestable {
    public var url: String {
        let baseURL: URL = .init(string: "https://wallhaven.cc/api/v1").unsafelyUnwrapped
        return baseURL.appendingPathComponent(path).absoluteString
    }

    public var method: HTTPMethod { .GET }

    public var headers: HTTPHeaders {
        switch APICenter.apiKey {
        case .none: return [:]
        case let .some(apiKey): return ["X-API-Key": apiKey]
        }
    }

    public var body: [UInt8]? { nil }
}
