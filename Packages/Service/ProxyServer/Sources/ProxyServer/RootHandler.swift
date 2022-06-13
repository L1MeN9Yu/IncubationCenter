//
// Created by Mengyu Li on 2022/6/13.
//

import FlyingFox
import Foundation

final class RootHandler {}

extension RootHandler: HTTPHandler {
    func handleRequest(_ request: HTTPRequest) async throws -> HTTPResponse {
        if request.method == .CONNECT {
            return .init(statusCode: .ok)
        }
        print("\(request)")
        guard let host = request.headers[.host] else { return HTTPResponse(version: .http11, statusCode: .forbidden, headers: [:], body: Data()) }
        guard let url = URL(string: host)?.appendingPathComponent(request.path) else { return HTTPResponse(version: .http11, statusCode: .forbidden, headers: [:], body: Data()) }
        return HTTPResponse(version: .http11, statusCode: .forbidden, headers: [:], body: Data())
    }
}
