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
            .register(FilterCollectionViewPurityCell.self, forCellWithReuseIdentifier: FilterCollectionViewPurityCell.cellID)
            .register(FilterCollectionViewSortingCell.self, forCellWithReuseIdentifier: FilterCollectionViewSortingCell.cellID)
            .register(FilterCollectionViewOrderCell.self, forCellWithReuseIdentifier: FilterCollectionViewOrderCell.cellID)
            .register(FilterCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FilterCollectionViewHeader.cellID)
            .register(FilterCollectionViewFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FilterCollectionViewFooter.cellID)
            .done
    }
}

extension FilterCollectionView {
    typealias DataSource = FilterCollectionViewDataSource
    typealias Snapshot = NSDiffableDataSourceSnapshot<FilterSection, FilterItemViewModel>
}
