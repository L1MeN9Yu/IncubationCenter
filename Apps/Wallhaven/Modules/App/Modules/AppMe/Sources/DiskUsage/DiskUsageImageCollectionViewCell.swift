//
// Created by Mengyu Li on 2022/7/1.
//

import BaseUI
import Foundation
import UIKit

class DiskUsageImageCollectionViewCell: CollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension DiskUsageImageCollectionViewCell {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension DiskUsageImageCollectionViewCell {
    func setup() {}

    func layout() {}
}

extension DiskUsageImageCollectionViewCell {
    func config(viewModel: DiskUsageImageViewModel) {}
}
