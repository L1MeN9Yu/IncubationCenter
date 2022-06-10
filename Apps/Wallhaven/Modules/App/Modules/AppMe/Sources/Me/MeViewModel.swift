//
// Created by Mengyu Li on 2022/6/2.
//

import ExtensionKit
import Foundation
import UICore

class MeViewModel: ViewModel {
    private(set) lazy var items: [MeSection: [MeItemViewModel]] = [
        .wallhaven: [
            MeItemViewModel(sectionID: 0, itemID: 0, title: MeModule.localizedString(key: "MeViewController.Item.APIKey"), detailText: MeModule.localizedString(key: "MeViewController.Item.APIKey.Detail")),
        ],
        .app: [
            MeItemViewModel(sectionID: 1, itemID: 0, title: MeModule.localizedString(key: "MeViewController.Item.General"), detailText: MeModule.localizedString(key: "MeViewController.Item.General.Detail")),
        ],
        .usage: [
            MeItemViewModel(sectionID: 2, itemID: 0, title: MeModule.localizedString(key: "MeViewController.Item.Usage"), detailText: MeModule.localizedString(key: "MeViewController.Item.Usage.Detail")),
        ],
        .about: [
            MeItemViewModel(sectionID: 3, itemID: 0, title: MeModule.localizedString(key: "MeViewController.Item.About"), detailText: MeModule.localizedString(key: "MeViewController.Item.About.Detail")),
            MeItemViewModel(sectionID: 3, itemID: 1, title: MeModule.localizedString(key: "MeViewController.Item.Version"), detailText: "\(Bundle.main.version.unwrapped(or: ""))  (\(Bundle.main.build.unwrapped(or: "")))"),
        ],
    ]
}
