//
// Created by Mengyu Li on 2022/6/27.
//

import Foundation
import UICore
import UIKit

class FilterCollectionView: CollectionView {
    init() {
        super.init(frame: .zero, collectionViewLayout: FilterCollectionViewLayout())
    }
}
