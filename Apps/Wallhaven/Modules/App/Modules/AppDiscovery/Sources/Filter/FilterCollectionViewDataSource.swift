//
// Created by Mengyu Li on 2022/6/27.
//

import Foundation
import UIKit

class FilterCollectionViewDataSource: UICollectionViewDiffableDataSource<FilterSection, FilterItemViewModel> {
    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView, cellProvider: Self.cellProvider)
        supplementaryViewProvider = Self.supplementaryViewProvider
    }
}

extension FilterCollectionViewDataSource {
    static func cellProvider(collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: FilterItemViewModel) -> UICollectionViewCell? {
        nil
    }

    static func supplementaryViewProvider(collectionView: UICollectionView, elementKind: String, indexPath: IndexPath) -> UICollectionReusableView? {
        nil
    }
}
