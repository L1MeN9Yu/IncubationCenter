//
// Created by Mengyu Li on 2022/6/17.
//

import Foundation
import UICore

class APIKeyAboutViewModel: ViewModel {
    let section = APIKeySection.about

    let routePattern: String = "WebBrowserViewController/https%3A%2F%2Fwallhaven.cc%2Fsettings%2Faccount"

    let titleText: String

    init(titleText: String) {
        self.titleText = titleText
        super.init()
    }
}

extension APIKeyAboutViewModel: APIKeyItemViewModelable {}
