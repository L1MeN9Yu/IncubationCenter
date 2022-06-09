//
// Created by Mengyu Li on 2022/6/2.
//

import UICore

class MeItemViewModel: ViewModel {
    let sectionID: Int
    let itemID: Int
    let title: String
    let detailText: String
    let iconImageSystemName: String?

    init(sectionID: Int, itemID: Int, title: String, detailText: String) {
        self.sectionID = sectionID
        self.itemID = itemID
        self.title = title
        self.detailText = detailText

        switch (sectionID, itemID) {
        case (0, 0):
            iconImageSystemName = "lock.shield"
        case (1, 0):
            iconImageSystemName = "gearshape"
        case (2, 0):
            iconImageSystemName = "folder"
        case (3, 0):
            iconImageSystemName = "info.circle"
        default:
            iconImageSystemName = .none
        }

        super.init()
    }
}

extension MeItemViewModel: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(sectionID)
        hasher.combine(itemID)
    }

    public static func == (lhs: MeItemViewModel, rhs: MeItemViewModel) -> Bool {
        lhs.sectionID == rhs.sectionID && lhs.itemID == rhs.itemID
    }
}
