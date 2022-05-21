//
// Created by Mengyu Li on 2022/5/21.
//

import AsyncHTTPClient
import Foundation
import NIOHTTP1
import NIOSSL

open class Request {
    public let url: String
    public let method: HTTPMethod
    public let headers: HTTPHeaders
    public let body: [UInt8]?

    public init(url: String, method: HTTPMethod, headers: HTTPHeaders, body: [UInt8]?) {
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
    }
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public extension Request {
    func export() -> HTTPClientRequest {
        var httpClientRequest = HTTPClientRequest(url: url)
        httpClientRequest.method = method
        httpClientRequest.headers = headers
        httpClientRequest.body = body.map { (raw: [UInt8]) -> HTTPClientRequest.Body in .bytes(raw) }
        return httpClientRequest
    }
}
