//
// Created by Mengyu Li on 2022/6/27.
//

import Foundation
import UICore
import UIKit

class FilterCollectionViewHeader: CollectionReusableView {
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

extension FilterCollectionViewHeader {
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension FilterCollectionViewHeader {
    func setup() {
        backgroundColor = .clear
        titleLabel.x.add(to: self)
    }

    func layout() {
        titleLabel.pin.all(10)
    }
}

extension FilterCollectionViewHeader {
    func config(section: FilterSection) {
        titleLabel.x.text(section.localizedTitle).done
    }
}
