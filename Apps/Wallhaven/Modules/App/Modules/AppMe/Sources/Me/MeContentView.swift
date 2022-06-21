//
// Created by Mengyu Li on 2022/5/20.
//

import UICore
import UIKit
import WeakDelegate

class MeContentView: View {
    private lazy var collectionView: CollectionView = .init(frame: .zero, collectionViewLayout: MeCollectionViewLayout())
        .x
        .backgroundColor(.clear)
        .delegate(self)
        .register(MeCollectionViewCell.self, forCellWithReuseIdentifier: MeCollectionViewCell.cellID)
        .register(MeCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MeCollectionHeaderView.cellID)
        .register(MeCollectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MeCollectionFooterView.cellID)
        .instance

    private lazy var dataSource = MeCollectionViewDataSource(collectionView: collectionView)

    private(set) lazy var didSelectedItemDelegator = Delegator<IndexPath, Void>()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

// MARK: - Override

extension MeContentView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

// MARK: - Private

private extension MeContentView {
    func setup() {
        backgroundColor = .systemWhite
        collectionView.x.add(to: self)
    }

    func layout() {
        collectionView.pin.all()
    }
}

// MARK: - UICollectionViewDelegate

extension MeContentView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectedItemDelegator.call(indexPath)
    }
}

extension MeContentView {
    func reloadData(viewModel: MeViewModel) {
        var snapshot = NSDiffableDataSourceSnapshot<MeSection, MeItemViewModel>()
        let sections = MeSection.allCases
        snapshot.appendSections(sections)
        sections.forEach { section in
            guard let itemViewModels = viewModel.items[section] else { return }
            snapshot.appendItems(itemViewModels, toSection: section)
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
