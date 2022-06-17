//
// Created by Mengyu Li on 2022/6/17.
//

import Foundation
import UIKit

class APIKeyCollectionViewDataSource: UICollectionViewDiffableDataSource<APIKeySection, APIKeyItem> {
    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView, cellProvider: Self.cellProvider)
        supplementaryViewProvider = Self.supplementaryViewProvider
    }
}

private extension APIKeyCollectionViewDataSource {
    static func cellProvider(collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: APIKeyItem) -> UICollectionViewCell? {
        switch itemIdentifier {
        case let .input(inputViewModel):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: APIKeyInputCollectionViewCell.cellID, for: indexPath) as? APIKeyInputCollectionViewCell
            cell.run { $0.config(viewModel: inputViewModel) }
            return cell
        case let .about(aboutViewModel):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: APIKeyAboutCollectionViewCell.cellID, for: indexPath) as? APIKeyAboutCollectionViewCell
            cell.run { $0.config(viewModel: aboutViewModel) }
            return cell
        }
    }

    static func supplementaryViewProvider(collectionView: UICollectionView, elementKind: String, indexPath: IndexPath) -> UICollectionReusableView? {
        switch elementKind {
        case UICollectionView.elementKindSectionFooter:
            let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: APIKeyCollectionFooterView.cellID, for: indexPath)
                as? APIKeyCollectionFooterView
            supplementaryView?.config(section: APIKeySection.allCases[indexPath.section])
            return supplementaryView
        default:
            return nil
        }
    }
}
