//
// Created by Mengyu Li on 2022/6/17.
//

import CenterAPI
import Foundation
import SwiftKit
import UICore

class APIKeyViewModel: ViewModel {
    private(set) lazy var items: OrderedDictionary<APIKeySection, [APIKeyItem]> = [
        APIKeySection.input: [
            APIKeyItem.input(APIKeyInputViewModel(apikey: APICenter.apikey)),
        ],
        APIKeySection.about: [
            APIKeyItem.about(APIKeyAboutViewModel(titleText: MeModule.localizedString(key: "APIKeyViewController.About.Title"))),
        ],
    ]
}

extension APIKeyViewModel {
    func setAPIKey(_ apikey: String) {
        items[.input]?
            .compactMap { item -> APIKeyInputViewModel? in
                if case let .input(viewModel) = item {
                    return viewModel
                }
                return nil
            }
            .forEach { $0.setAPIKey(apikey) }
    }

    func resetAPIKey() {
        items[.input]?
            .compactMap { item -> APIKeyInputViewModel? in
                if case let .input(viewModel) = item {
                    return viewModel
                }
                return nil
            }
            .forEach { $0.resetAPIKey() }
    }
}
