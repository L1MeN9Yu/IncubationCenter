//
// Created by Mengyu Li on 2022/6/2.
//

import UIKit

class MeCollectionViewDataSource: UICollectionViewDiffableDataSource<MeSection, MeItemViewModel> {
    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView, cellProvider: Self.cellProvider)
    }
}

private extension MeCollectionViewDataSource {
    static func cellProvider(collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: MeItemViewModel) -> UICollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MeCollectionViewCell.cellID, for: indexPath)
            as? MeCollectionViewCell
        cell?.config(viewModel: itemIdentifier)
        return cell
    }
}
