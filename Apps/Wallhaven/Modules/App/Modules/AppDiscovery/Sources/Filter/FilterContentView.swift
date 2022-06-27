//
// Created by Mengyu Li on 2022/6/27.
//

import Foundation
import UICore
import UIKit

class FilterContentView: View {
    private lazy var collectionView: FilterCollectionView = .init()
        .x
        .delegate(self)
        .instance

    private lazy var dataSource = FilterCollectionView.DataSource(collectionView: collectionView)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension FilterContentView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension FilterContentView {
    func setup() {
        backgroundColor = .systemWhite
        collectionView.x.add(to: self)
    }

    func layout() {
        collectionView.pin.all(pin.safeArea)
    }
}

extension FilterContentView {
    func reloadData(viewModel: FilterViewModel) {
        var snapshot = FilterCollectionView.Snapshot()
        viewModel.items.forEach {
            snapshot.appendSections([$0])
            snapshot.appendItems($1, toSection: $0)
        }
        dataSource.apply(snapshot)
    }
}

extension FilterContentView: UICollectionViewDelegate {}
