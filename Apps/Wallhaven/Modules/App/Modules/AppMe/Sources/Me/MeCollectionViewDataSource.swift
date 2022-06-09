//
// Created by Mengyu Li on 2022/6/2.
//

import UIKit

class MeCollectionViewDataSource: UICollectionViewDiffableDataSource<MeSection, MeItemViewModel> {
    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView, cellProvider: Self.cellProvider)
        supplementaryViewProvider = Self.supplementaryViewProvider
    }
}

private extension MeCollectionViewDataSource {
    static func cellProvider(collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: MeItemViewModel) -> UICollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MeCollectionViewCell.cellID, for: indexPath)
            as? MeCollectionViewCell
        cell?.config(viewModel: itemIdentifier)
        return cell
    }

    static func supplementaryViewProvider(collectionView: UICollectionView, elementKind: String, indexPath: IndexPath) -> UICollectionReusableView? {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: MeCollectionHeaderView.cellID, for: indexPath)
            as? MeCollectionHeaderView
        supplementaryView?.config(section: MeSection.allCases[indexPath.section])
        return supplementaryView
    }
}
