//
// Created by Mengyu Li on 2022/5/20.
//

import UICore
import UIKit

class DiscoveryContentView: View {
    private lazy var collectionView: CollectionView = .init(
        frame: .zero,
        collectionViewLayout: DiscoveryCollectionViewLayout()
            .x
            .instance
    )
    .x
    .delegate(self)
    .instance

    private lazy var dataSource = DiscoveryCollectionViewDataSource(collectionView: collectionView)

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension DiscoveryContentView {
    func setup() {
        backgroundColor = .systemWhite
        collectionView.x.add(to: self)
    }
}

extension DiscoveryContentView {
    override open func layoutSubviews() {
        super.layoutSubviews()

        collectionView.pin.all()
    }
}

extension DiscoveryContentView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}
