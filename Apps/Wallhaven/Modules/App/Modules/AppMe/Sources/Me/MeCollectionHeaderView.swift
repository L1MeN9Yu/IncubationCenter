//
// Created by Mengyu Li on 2022/6/9.
//

import Foundation
import UICore
import UIKit

class MeCollectionHeaderView: CollectionReusableView {
    private lazy var titleLabel: UILabel = .init(frame: .zero)
        .x
        .font(.preferredFont(forTextStyle: .caption1))
        .textColor(.systemBlack)
        .instance

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension MeCollectionHeaderView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension MeCollectionHeaderView {
    func setup() {
        backgroundColor = .systemGray6
        titleLabel.x.add(to: self)
    }

    func layout() {
        titleLabel.pin.all(8)
    }
}

extension MeCollectionHeaderView {
    func config(section: MeSection) {
        titleLabel.text = section.localizedTitle
    }
}
