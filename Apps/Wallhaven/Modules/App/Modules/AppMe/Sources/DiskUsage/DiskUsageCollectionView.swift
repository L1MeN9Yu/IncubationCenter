//
// Created by Mengyu Li on 2022/7/1.
//

import BaseUI
import Chain
import Foundation
import UIKit
import UILayout

class DiskUsageCollectionView: CollectionView {
    init() {
        super.init(frame: .zero, collectionViewLayout: DiskUsageCollectionViewLayout())
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension DiskUsageCollectionView {
    func setup() {
        x
            .backgroundColor(.clear)
            .register(DiskUsageDeviceCollectionViewCell.self, forCellWithReuseIdentifier: DiskUsageDeviceCollectionViewCell.cellID)
            .register(DiskUsageAppCollectionViewCell.self, forCellWithReuseIdentifier: DiskUsageAppCollectionViewCell.cellID)
            .register(DiskUsageCacheCollectionViewCell.self, forCellWithReuseIdentifier: DiskUsageCacheCollectionViewCell.cellID)
            .register(DiskUsageBundleCollectionViewCell.self, forCellWithReuseIdentifier: DiskUsageBundleCollectionViewCell.cellID)
            .register(DiskUsageCollectionViewFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: DiskUsageCollectionViewFooter.cellID)
            .done
    }
}

extension DiskUsageCollectionView {
    typealias DataSource = DiskUsageCollectionViewDataSource
    typealias Snapshot = NSDiffableDataSourceSnapshot<DiskUsageSection, DiskUsageItem>
}
