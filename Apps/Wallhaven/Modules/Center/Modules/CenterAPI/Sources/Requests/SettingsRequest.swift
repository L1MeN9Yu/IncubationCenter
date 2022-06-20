//
// Created by Mengyu Li on 2022/6/20.
//

import Foundation

class SettingsRequest: BaseRequestable {
    let path: String = "/api/v1/settings"

    let queryItems: [URLQueryItem]?

    init(apikey: String) {
        queryItems = [
            URLQueryItem(name: "apikey", value: apikey),
        ]
    }
}
