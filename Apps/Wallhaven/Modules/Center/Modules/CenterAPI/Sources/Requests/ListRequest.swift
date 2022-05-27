//
// Created by Mengyu Li on 2022/5/22.
//

import Foundation

class ListRequest: BaseRequestable {
    let path: String = "/api/v1/search"
    let page: UInt

    let queryItems: [URLQueryItem]?

    init(page: UInt) {
        self.page = page

        queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
        ]
    }
}
