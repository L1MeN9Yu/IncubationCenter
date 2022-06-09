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

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(36.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)

        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(1.0))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)

        section.boundarySupplementaryItems = [
            header,
            footer,
        ]
        self.init(section: section)
    }
}
