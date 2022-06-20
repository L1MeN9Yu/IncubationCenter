//
// Created by Mengyu Li on 2022/6/17.
//

import Foundation
import UICore

class APIKeyInputViewModel: ViewModel {
    let section = APIKeySection.input

    private(set) var apikey: String? = .none

    init(apikey: String?) {
        self.apikey = apikey
        super.init()
    }
}

extension APIKeyInputViewModel {
    func setAPIKey(_ apikey: String) {
        self.apikey = apikey
    }

    func resetAPIKey() {
        apikey = .none
    }
}

extension APIKeyInputViewModel: APIKeyItemViewModelable {}
