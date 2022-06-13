//
// Created by Mengyu Li on 2022/6/13.
//

import FlyingFox
import Foundation

final class RootHandler {}

extension RootHandler: HTTPHandler {
    func handleRequest(_ request: HTTPRequest) async throws -> HTTPResponse {
        print("\(request)")
        return HTTPResponse(version: .http11, statusCode: .forbidden, headers: [:], body: Data())
    }
}
