//
// Created by Mengyu Li on 2022/5/24.
//

import UIKit

class DiscoveryCollectionViewDataSource: UICollectionViewDiffableDataSource<String, WallpaperListViewModel> {
    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView, cellProvider: Self.cellProvider)
    }
}

extension DiscoveryCollectionViewDataSource {
    static func cellProvider(collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: WallpaperListViewModel) -> UICollectionViewCell? {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoveryCollectionViewCell.cellID, for: indexPath)
            as? DiscoveryCollectionViewCell
        cell?.config(viewModel: itemIdentifier)
        return cell
    }
}
