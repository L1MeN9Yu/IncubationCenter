//
// Created by Mengyu Li on 2022/6/27.
//

import Foundation
import UICore
import UIKit

class FilterCollectionViewFooter: CollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension FilterCollectionViewFooter {
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension FilterCollectionViewFooter {
    func setup() {
        backgroundColor = .systemGray6
    }

    func layout() {}
}

extension FilterCollectionViewFooter {
    func config(section: FilterSection) {}
}
