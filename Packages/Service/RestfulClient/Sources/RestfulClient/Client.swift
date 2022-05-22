//
// Created by Mengyu Li on 2022/5/21.
//

import AsyncHTTPClient
import Foundation
import Logging

open class Client {
    private let httpClient: HTTPClient
    private let logger: Logger

    public init(eventLoopGroupProvider: HTTPClient.EventLoopGroupProvider = .createNew, configuration: Configuration = Configuration(), logger: Logger) {
        self.logger = logger
        httpClient = HTTPClient(
            eventLoopGroupProvider: eventLoopGroupProvider,
            configuration: configuration.export(),
            backgroundActivityLogger: logger
        )
    }

    deinit {
        do {
            if #available(iOS 13.0, *) {
                Task {
                    try await httpClient.shutdown()
                }
            } else {
                try httpClient.syncShutdown()
            }
        } catch {
            logger.error("\(error)")
        }
    }
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public extension Client {
    func execute<Request: Requestable>(request: Request) async throws -> Response {
        let httpResponse = try await httpClient.execute(
            request.export(),
            timeout: .seconds(10),
            logger: logger
        )
        let body = try await httpResponse.body.collect(upTo: 10 * 1024 * 1024)

        let response: Response = .import(httpClientResponse: httpResponse, body: body)

        return response
    }
}
