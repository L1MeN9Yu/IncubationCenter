//
// Created by Mengyu Li on 2022/7/1.
//

import BaseUI
import Foundation
import UIKit

class DiskUsageAppCollectionViewCell: CollectionViewCell {
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
    func setup() {}

    func layout() {}
}

extension DiskUsageAppCollectionViewCell {
    func config(viewModel: DiskUsageAppViewModel) {}
}
