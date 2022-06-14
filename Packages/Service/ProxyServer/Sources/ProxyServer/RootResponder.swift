//
// Created by Mengyu Li on 2022/6/14.
//

import Foundation
import HummingbirdCore
import Logging
import NIO
import NIOHTTP1

class RootResponder {
    let logger: Logger

    init(logger: Logger) { self.logger = logger }
}

extension RootResponder: HBHTTPResponder {
    func respond(to request: HBHTTPRequest, context: ChannelHandlerContext, onComplete: @escaping (Result<HBHTTPResponse, Error>) -> Void) {
        logger.debug("\(request)")

        let header = HTTPResponseHead(version: .http1_1, status: .forbidden)
        let response = HBHTTPResponse(head: header, body: .empty)
        onComplete(.success(response))
    }
}
