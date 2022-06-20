//
// Created by Mengyu Li on 2022/6/17.
//

import Foundation
import UICore
import UIKit

class APIKeyAboutCollectionViewCell: CollectionViewCell {
    private lazy var titleLabel: UILabel = .init(frame: .zero)
        .x
        .textColor(.systemBlack)
        .instance

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension APIKeyAboutCollectionViewCell {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension APIKeyAboutCollectionViewCell {
    func setup() {
        titleLabel.x.add(to: contentView)
    }

    func layout() {
        titleLabel.pin.bottomCenter().sizeToFit()
    }
}

extension APIKeyAboutCollectionViewCell {
    func config(viewModel: APIKeyAboutViewModel) {
        titleLabel.x.text(viewModel.titleText).done
    }
}
