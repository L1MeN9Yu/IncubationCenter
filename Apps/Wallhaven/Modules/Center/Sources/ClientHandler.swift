//
// Created by Mengyu Li on 2022/6/14.
//

import Foundation
import HummingbirdCore
import Logging
import NIO
import RestfulClient
import Service

class ClientHandler {
    let eventGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    let logger: Logger
    let client: Client

    init(logger: Logger) {
        self.logger = logger
        client = Client(eventLoopGroupProvider: .shared(eventGroup), logger: logger)
    }
}

extension ClientHandler: ClientHandle {
    func execute(request: HBHTTPRequest, onComplete: @escaping (Result<HBHTTPResponse, Error>) -> Void) {
        let header = HTTPResponseHead(version: .http1_1, status: .forbidden)
        let response = HBHTTPResponse(head: header, body: .empty)
        onComplete(.success(response))
    }
}
