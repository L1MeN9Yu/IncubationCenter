//
// Created by Mengyu Li on 2022/6/17.
//

import Foundation
import UICore

class APIKeyViewModel: ViewModel {
    private(set) lazy var items: [APIKeySection: [APIKeyItem]] = [
        .input: [
            .input(APIKeyInputViewModel()),
        ],
        .about: [
            .about(APIKeyAboutViewModel(titleText: MeModule.localizedString(key: "APIKeyViewController.About.Title"))),
        ],
    ]
}
