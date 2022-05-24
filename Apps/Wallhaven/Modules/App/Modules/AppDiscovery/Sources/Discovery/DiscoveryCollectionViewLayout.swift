//
// Created by Mengyu Li on 2022/5/24.
//

import UIKit

class DiscoveryCollectionViewLayout: UICollectionViewCompositionalLayout {
    convenience init() {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let fullPhotoItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(9.0 / 16.0)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: fullPhotoItem,
            count: 3
        )
        let section = NSCollectionLayoutSection(group: group)
        self.init(section: section)
    }
}
