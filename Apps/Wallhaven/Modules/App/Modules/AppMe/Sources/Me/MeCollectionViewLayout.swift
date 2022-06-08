//
// Created by Mengyu Li on 2022/6/2.
//

import UIKit

class MeCollectionViewLayout: UICollectionViewCompositionalLayout {
    convenience init() {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(60)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 1
        )
        let section = NSCollectionLayoutSection(group: group)
        self.init(section: section)
    }
}