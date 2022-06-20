//
// Created by Mengyu Li on 2022/6/20.
//

import NIOHTTP1

public struct HTTPError: Error {
    public let code: UInt
    private let httpResponseStatus: HTTPResponseStatus

    init(httpResponseStatus: HTTPResponseStatus) {
        self.httpResponseStatus = httpResponseStatus
        code = httpResponseStatus.code
    }
}

extension HTTPError: CustomStringConvertible {
    public var description: String {
        httpResponseStatus.reasonPhrase
    }
}
