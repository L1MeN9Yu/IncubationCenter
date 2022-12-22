//
// Created by Mengyu Li on 2022/7/1.
//

import UIBase
import Foundation
import UIKit

class DiskUsageAppCollectionViewCell: CollectionViewCell {
    private lazy var titleLabel: UILabel = .init(frame: .zero)
        .x
        .tintColor(.systemGray2)
        .font(.preferredFont(forTextStyle: .footnote))
        .instance
    private lazy var valueLabel: UILabel = .init(frame: .zero)
        .x
        .textColor(.systemBlack)
        .font(.preferredFont(forTextStyle: .title3))
        .instance
    private lazy var descriptionLabel: UILabel = .init(frame: .zero)
        .x
        .textColor(.systemGray4)
        .font(.preferredFont(forTextStyle: .footnote))
        .numberOfLines(0)
        .instance

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension DiskUsageAppCollectionViewCell {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension DiskUsageAppCollectionViewCell {
    func setup() {
        titleLabel.x.add(to: contentView)
        valueLabel.x.add(to: contentView)
        descriptionLabel.x.add(to: contentView)
    }

    func layout() {
        titleLabel.pin.left(8).top().margin(8).sizeToFit(.content)
        valueLabel.pin.below(of: titleLabel).left(8).margin(8).sizeToFit(.content)
        descriptionLabel.pin.below(of: valueLabel).left(8).margin(8).sizeToFit(.content)
    }
}

extension DiskUsageAppCollectionViewCell {
    func config(viewModel: DiskUsageAppViewModel) {
        titleLabel.x.text(viewModel.titleText).done
        valueLabel.x.text(viewModel.valueText).done
        descriptionLabel.x.text(viewModel.descriptionText).done
        setNeedsLayout()
    }
}
