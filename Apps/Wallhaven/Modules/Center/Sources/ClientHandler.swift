//
// Created by Mengyu Li on 2022/6/14.
//

import AsyncHTTPClient
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
        func forbidden() -> HBHTTPResponse {
            let header = HTTPResponseHead(version: .http1_1, status: .forbidden)
            let response = HBHTTPResponse(head: header, body: .empty)
            return response
        }

        do {
            try client.execute(
                request: HTTPClient.Request(
                    url: request.head.uri,
                    method: request.head.method,
                    headers: request.head.headers,
                    body: request.body.buffer.map { HTTPClient.Body.byteBuffer($0) }
                )
            ) {
                onComplete(
                    $0.map {
                        HBHTTPResponse(head: .init(version: $0.version, status: $0.status, headers: $0.headers), body: .byteBuffer(ByteBuffer(data: $0.body)))
                    }
                )
            }
        } catch {
            return onComplete(.failure(error))
        }
    }
}
