//
// Created by Mengyu Li on 2022/5/20.
//

import Service
import UICore
import UIKit

class DiscoveryContentView: View {
    let headerRefreshDelegator = Delegator<Refresher, Void>()
    let footerRefreshDelegator = Delegator<Refresher, Void>()
    let didSelectedDelegator = Delegator<IndexPath, Void>()

    private lazy var collectionView: CollectionView = .init(
        frame: .zero,
        collectionViewLayout: DiscoveryCollectionViewLayout()
            .x
            .instance
    )
    .x
    .backgroundColor(.clear)
    .register(DiscoveryCollectionViewCell.self, forCellWithReuseIdentifier: DiscoveryCollectionViewCell.cellID)
    .delegate(self)
    .topRefresher(
        Refresher { [weak self] refresher in
            guard let self = self else { return }
            self.headerRefreshDelegator(refresher)
        }
    )
    .bottomRefresher(
        Refresher { [weak self] refresher in
            guard let self = self else { return }
            self.footerRefreshDelegator(refresher)
        }
    )
    .instance

    private lazy var dataSource = DiscoveryCollectionViewDataSource(collectionView: collectionView)

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

// MARK: - Private

private extension DiscoveryContentView {
    func setup() {
        backgroundColor = .systemWhite
        collectionView.x.add(to: self)
        collectionView.topRefresher?.beginRefreshing()
    }
}

// MARK: - Override

extension DiscoveryContentView {
    override open func layoutSubviews() {
        super.layoutSubviews()

        collectionView.pin.all()
    }
}

// MARK: - UICollectionViewDelegate

extension DiscoveryContentView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectedDelegator(indexPath)
    }
}

// MARK: - Internal

extension DiscoveryContentView {
    func reloadData(viewModel: DiscoveryViewModel) {
        var snapshot = NSDiffableDataSourceSnapshot<String, WallpaperListViewModel>()
        snapshot.appendSections(["main"])
        snapshot.appendItems(viewModel.wallpaperListViewModels)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
