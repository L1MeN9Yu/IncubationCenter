//
// Created by Mengyu Li on 2022/5/20.
//

import UICore
import UIKit

class MeContentView: View {
    private lazy var collectionView = CollectionView(frame: .zero, collectionViewLayout: MeCollectionViewLayout())
        .x
        .delegate(self)
        .register(MeCollectionViewCell.self, forCellWithReuseIdentifier: MeCollectionViewCell.cellID)
        .instance

    private lazy var dataSource = MeCollectionViewDataSource(collectionView: collectionView)

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

extension MeContentView: UICollectionViewDelegate {}

extension MeContentView {
    func reloadData() {}
}
