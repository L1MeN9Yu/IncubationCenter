//
// Created by Mengyu Li on 2022/7/1.
//

import BaseUI
import Foundation
import UIKit

class DiskUsageCollectionViewFooter: CollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension DiskUsageCollectionViewFooter {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension DiskUsageCollectionViewFooter {
    func setup() {
        backgroundColor = .systemGray6
    }

    func layout() {}
}
