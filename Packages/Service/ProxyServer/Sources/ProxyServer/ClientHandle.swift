//
// Created by Mengyu Li on 2022/6/14.
//

import Foundation
import HummingbirdCore

public protocol ClientHandle {
    func execute(request: HBHTTPRequest, onComplete: @escaping (Result<HBHTTPResponse, Error>) -> Void)
}
