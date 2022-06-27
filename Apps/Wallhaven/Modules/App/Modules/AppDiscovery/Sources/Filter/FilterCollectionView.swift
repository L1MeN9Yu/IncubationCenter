//
// Created by Mengyu Li on 2022/6/27.
//

import Foundation
import UICore
import UIKit

class FilterCollectionView: CollectionView {
    init() {
        super.init(frame: .zero, collectionViewLayout: FilterCollectionViewLayout())
        x
            .backgroundColor(.clear)
            .register(FilterCollectionViewCategoriesCell.self, forCellWithReuseIdentifier: FilterCollectionViewCategoriesCell.cellID)
            .register(FilterCollectionViewFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FilterCollectionViewFooter.cellID)
            .done
    }
}

extension FilterCollectionView {
    typealias DataSource = FilterCollectionViewDataSource
    typealias Snapshot = NSDiffableDataSourceSnapshot<FilterSection, FilterItemViewModel>
}
