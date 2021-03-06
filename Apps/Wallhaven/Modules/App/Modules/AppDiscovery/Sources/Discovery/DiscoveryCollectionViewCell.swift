//
// Created by Mengyu Li on 2022/5/23.
//

import UICore
import UIKit

class DiscoveryCollectionViewCell: CollectionViewCell {
    private lazy var imageView = UIImageView(frame: .zero)
        .x
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
        .instance

    private lazy var blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension DiscoveryCollectionViewCell {
    func setup() {
        imageView.x.add(to: contentView)
        blurEffectView.x.add(to: contentView)
    }
}

extension DiscoveryCollectionViewCell {
    override open func layoutSubviews() {
        super.layoutSubviews()
        imageView.pin.all(contentView.pin.safeArea)
        blurEffectView.pin.all(contentView.pin.safeArea)
    }
}

extension DiscoveryCollectionViewCell {
    func config(viewModel: DiscoveryItemViewModel) {
        imageView.kf.setImage(with: viewModel.imageURL)
        switch viewModel.purity {
        case "nsfw": blurEffectView.x.isHidden(false).done
        default: blurEffectView.x.isHidden(true).done
        }
    }
}
