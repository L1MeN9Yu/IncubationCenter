//
// Created by Mengyu Li on 2022/6/2.
//

import ExtensionKit
import Foundation
import OrderedCollections
import UICore

class MeViewModel: ViewModel {
    private(set) lazy var items: OrderedDictionary<MeSection, [MeItemViewModel]> = [
        MeSection.wallhaven: [
            MeItemViewModel(sectionID: 0, itemID: 0, title: MeModule.localizedString(key: "MeViewController.Item.APIKey"), detailText: MeModule.localizedString(key: "MeViewController.Item.APIKey.Detail")),
        ],
        MeSection.app: [
            MeItemViewModel(sectionID: 1, itemID: 0, title: MeModule.localizedString(key: "MeViewController.Item.General"), detailText: MeModule.localizedString(key: "MeViewController.Item.General.Detail")),
        ],
        MeSection.usage: [
            MeItemViewModel(sectionID: 2, itemID: 0, title: MeModule.localizedString(key: "MeViewController.Item.Usage"), detailText: MeModule.localizedString(key: "MeViewController.Item.Usage.Detail")),
        ],
        MeSection.about: [
            MeItemViewModel(sectionID: 3, itemID: 0, title: MeModule.localizedString(key: "MeViewController.Item.About"), detailText: MeModule.localizedString(key: "MeViewController.Item.About.Detail")),
            MeItemViewModel(sectionID: 3, itemID: 1, title: MeModule.localizedString(key: "MeViewController.Item.Version"), detailText: "\(Bundle.main.version.unwrapped(or: ""))  (\(Bundle.main.build.unwrapped(or: "")))"),
        ],
    ]
}
