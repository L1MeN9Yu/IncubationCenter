//
// Created by Mengyu Li on 2022/6/17.
//

import Foundation
import SwiftKit
import UICore

class APIKeyViewModel: ViewModel {
    private(set) lazy var items: OrderedDictionary<APIKeySection, [APIKeyItem]> = [
        APIKeySection.input: [
            APIKeyItem.input(APIKeyInputViewModel()),
        ],
        APIKeySection.about: [
            APIKeyItem.about(APIKeyAboutViewModel(titleText: MeModule.localizedString(key: "APIKeyViewController.About.Title"))),
        ],
    ]
}
