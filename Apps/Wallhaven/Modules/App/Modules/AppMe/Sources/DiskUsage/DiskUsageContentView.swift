//
// Created by Mengyu Li on 2022/6/30.
//

import UIBase
import Foundation
import UIExtensionsKit
import UIKit

class DiskUsageContentView: View {
    private lazy var collectionView: DiskUsageCollectionView = .init()
        .x
        .delegate(self)
        .instance

    private lazy var dataSource = DiskUsageCollectionView.DataSource(collectionView: collectionView)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension DiskUsageContentView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension DiskUsageContentView {
    func setup() {
        backgroundColor = .systemWhite
        collectionView.x.add(to: self)
    }

    func layout() {
        collectionView.pin.all(pin.safeArea)
    }
}

extension DiskUsageContentView {
    func reloadData(viewModel: DiskUsageViewModel) {
        var snapshot = DiskUsageCollectionView.Snapshot()
        viewModel.items.forEach {
            snapshot.appendSections([$0])
            snapshot.appendItems($1, toSection: $0)
        }
        dataSource.apply(snapshot)
    }
}

extension DiskUsageContentView: UICollectionViewDelegate {}
