//
// Created by Mengyu Li on 2022/6/27.
//

import Foundation
import UICore
import UIKit

class FilterContentView: View {
    private lazy var collectionView = FilterCollectionView()
        .x
        .delegate(self)
        .instance

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

extension FilterContentView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}
