//
// Created by Mengyu Li on 2022/6/2.
//

import Foundation
import UICore
import UIKit

class MeCollectionViewCell: CollectionViewCell {
    private lazy var iconImageView: UIImageView = .init(frame: .zero)
        .x
        .tintColor(.systemBlack)
        .contentMode(.scaleAspectFit)
        .instance

    private lazy var titleLabel: UILabel = .init(frame: .zero)
        .x
        .font(.preferredFont(forTextStyle: .body))
        .textColor(.systemBlack)
        .instance

    private lazy var detailLabel: UILabel = .init(frame: .zero)
        .x
        .font(.preferredFont(forTextStyle: .footnote))
        .textColor(.systemGray)
        .instance

    override init(frame: CGRect) {
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
    func setup() {
        iconImageView.x.add(to: contentView)
        titleLabel.x.add(to: contentView)
        detailLabel.x.add(to: contentView)
    }

    func layout() {
        iconImageView.pin.top().left().bottom().margin(14).aspectRatio(1)
        titleLabel.pin.after(of: iconImageView, aligned: .top).marginLeft(20).right(10).sizeToFit()
        detailLabel.pin.after(of: iconImageView, aligned: .bottom).marginLeft(20).right(10).sizeToFit()
    }
}

extension MeCollectionViewCell {
    func config(viewModel: MeItemViewModel) {
        if let iconImageSystemName = viewModel.iconImageSystemName {
            iconImageView.image = UIImage(systemName: iconImageSystemName)
        }
        titleLabel.text = viewModel.title
        detailLabel.text = viewModel.detailText
    }
}
