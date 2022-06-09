//
// Created by Mengyu Li on 2022/6/2.
//

import UICore

class MeViewModel: ViewModel {
    private(set) lazy var items: [MeSection: [MeItemViewModel]] = [
        .wallhaven: [
            MeItemViewModel(sectionID: 0, itemID: 0, title: "API Key", detailText: "Your Wallhaven API Key"),
        ],
    ]
}
