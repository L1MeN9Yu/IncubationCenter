//
// Created by Mengyu Li on 2022/6/16.
//

import Foundation
import UICore
import UIKit
import WeakDelegate

class APIKeyContentView: View {
    private lazy var collectionView: CollectionView = .init(frame: .zero, collectionViewLayout: APIKeyCollectionViewLayout())
        .x
        .backgroundColor(.clear)
        .keyboardDismissMode(.onDrag)
        .delegate(self)
        .register(APIKeyInputCollectionViewCell.self, forCellWithReuseIdentifier: APIKeyInputCollectionViewCell.cellID)
        .register(APIKeyAboutCollectionViewCell.self, forCellWithReuseIdentifier: APIKeyAboutCollectionViewCell.cellID)
        .register(APIKeyCollectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: APIKeyCollectionFooterView.cellID)
        .instance

    private lazy var dataSource = APIKeyCollectionViewDataSource(collectionView: collectionView)

    private(set) lazy var didSelectedItemDelegate = Delegator<IndexPath, Void>()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension APIKeyContentView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension APIKeyContentView {
    func setup() {
        backgroundColor = .systemWhite
        collectionView.x.add(to: self)
    }

    func layout() {
        collectionView.pin.all()
    }
}

// MARK: - UICollectionViewDelegate

extension APIKeyContentView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectedItemDelegate.call(indexPath)
    }
}

extension APIKeyContentView {
    func reloadData(viewModel: APIKeyViewModel) {
        var snapshot = NSDiffableDataSourceSnapshot<APIKeySection, APIKeyItem>()
        viewModel.items.forEach {
            snapshot.appendSections([$0])
            snapshot.appendItems($1, toSection: $0)
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
