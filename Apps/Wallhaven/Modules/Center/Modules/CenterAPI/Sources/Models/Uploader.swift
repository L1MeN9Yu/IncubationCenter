//
// Created by Mengyu Li on 2022/5/30.
//

import Foundation

public struct Uploader: Codable {
    // "username": "test-user",
    public let username: String
    // "group": "User",
    public let group: String

    public let avatar: Avatar
}

public extension Uploader {
    struct Avatar: Codable {
        // "200px": "https://wallhaven.cc/images/user/avatar/200/11_3339efb2a813.png",
        public let px200: String
        // "128px": "https://wallhaven.cc/images/user/avatar/128/11_3339efb2a813.png",
        public let px128: String
        // "32px": "https://wallhaven.cc/images/user/avatar/32/11_3339efb2a813.png",
        public let px32: String
        // "20px": "https://wallhaven.cc/images/user/avatar/20/11_3339efb2a813.png"
        public let px20: String

        enum CodingKeys: String, CodingKey {
            case px200 = "200px"
            case px128 = "128px"
            case px32 = "32px"
            case px20 = "20px"
        }
    }
}
