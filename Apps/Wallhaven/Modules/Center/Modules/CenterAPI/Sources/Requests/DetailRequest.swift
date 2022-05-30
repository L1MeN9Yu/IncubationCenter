//
// Created by Mengyu Li on 2022/5/30.
//

import Foundation

class DetailRequest: BaseRequestable {
    let id: String
    let path: String

    init(id: String) {
        self.id = id
        path = "api/v1/w/\(id)"
    }
}
