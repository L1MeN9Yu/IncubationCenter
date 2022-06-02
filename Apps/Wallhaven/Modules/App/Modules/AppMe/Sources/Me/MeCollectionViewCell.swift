//
// Created by Mengyu Li on 2022/6/2.
//

import UICore

class MeCollectionViewCell: CollectionViewCell {
    override init(frame: CoreGraphics.CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

// MARK: - Override

extension MeCollectionViewCell {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension MeCollectionViewCell {
    func setup() {}

    func layout() {}
}

extension MeCollectionViewCell {
    func config(viewModel: MeItemViewModel) {}
}
