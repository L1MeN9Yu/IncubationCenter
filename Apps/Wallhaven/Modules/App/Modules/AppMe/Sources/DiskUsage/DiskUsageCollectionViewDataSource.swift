//
// Created by Mengyu Li on 2022/7/1.
//

import ExtensionKit
import Foundation
import UIKit

class DiskUsageCollectionViewDataSource: UICollectionViewDiffableDataSource<DiskUsageSection, DiskUsageItem> {
    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView, cellProvider: Self.cellProvider)
        supplementaryViewProvider = Self.supplementaryViewProvider
    }
}

extension DiskUsageCollectionViewDataSource {
    static func cellProvider(collectionView: UICollectionView, indexPath: IndexPath, item: DiskUsageItem) -> UICollectionViewCell? {
        switch item {
        case let .device(viewModel):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiskUsageDeviceCollectionViewCell.cellID, for: indexPath) as? DiskUsageDeviceCollectionViewCell
            cell.run { $0.config(viewModel: viewModel) }
            return cell
        case let .app(viewModel):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiskUsageAppCollectionViewCell.cellID, for: indexPath) as? DiskUsageAppCollectionViewCell
            cell.run { $0.config(viewModel: viewModel) }
            return cell
        case let .image(viewModel):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiskUsageImageCollectionViewCell.cellID, for: indexPath) as? DiskUsageImageCollectionViewCell
            cell.run { $0.config(viewModel: viewModel) }
            return cell
        case let .bundle(viewModel):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiskUsageBundleCollectionViewCell.cellID, for: indexPath) as? DiskUsageBundleCollectionViewCell
            cell.run { $0.config(viewModel: viewModel) }
            return cell
        }
    }

    static func supplementaryViewProvider(collectionView: UICollectionView, elementKind: String, indexPath: IndexPath) -> UICollectionReusableView? {
        switch elementKind {
        case UICollectionView.elementKindSectionHeader:
            return nil
        case UICollectionView.elementKindSectionFooter:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: DiskUsageCollectionViewFooter.cellID, for: indexPath) as? DiskUsageCollectionViewFooter
            return view
        default:
            return nil
        }
    }
}
