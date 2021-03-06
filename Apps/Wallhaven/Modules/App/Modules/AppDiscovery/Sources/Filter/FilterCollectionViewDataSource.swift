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
    static func cellProvider(collectionView: UICollectionView, indexPath: IndexPath, viewModel: FilterItemViewModel) -> UICollectionViewCell? {
        switch viewModel.section {
        case .categories:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCategoriesCell.cellID, for: indexPath) as? FilterCollectionViewCategoriesCell
            cell.map { $0.config(viewModel: viewModel) }
            return cell
        case .purity:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewPurityCell.cellID, for: indexPath) as? FilterCollectionViewPurityCell
            cell.map { $0.config(viewModel: viewModel) }
            return cell
        case .sorting:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewSortingCell.cellID, for: indexPath) as? FilterCollectionViewSortingCell
            cell.map { $0.config(viewModel: viewModel) }
            return cell
        case .order:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewOrderCell.cellID, for: indexPath) as? FilterCollectionViewOrderCell
            cell.map { $0.config(viewModel: viewModel) }
            return cell
        }
    }

    static func supplementaryViewProvider(collectionView: UICollectionView, elementKind: String, indexPath: IndexPath) -> UICollectionReusableView? {
        switch elementKind {
        case UICollectionView.elementKindSectionHeader:
            let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: FilterCollectionViewHeader.cellID, for: indexPath)
                as? FilterCollectionViewHeader
            supplementaryView.map { $0.config(section: FilterSection.allCases[indexPath.section]) }
            return supplementaryView
        case UICollectionView.elementKindSectionFooter:
            let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: FilterCollectionViewFooter.cellID, for: indexPath)
                as? FilterCollectionViewFooter
            supplementaryView.map { $0.config(section: FilterSection.allCases[indexPath.section]) }
            return supplementaryView
        default:
            return nil
        }
    }
}
