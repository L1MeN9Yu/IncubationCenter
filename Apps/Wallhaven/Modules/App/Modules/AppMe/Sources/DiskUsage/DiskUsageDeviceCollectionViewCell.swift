//
// Created by Mengyu Li on 2022/7/1.
//

import BaseUI
import Foundation
import UIKit

class DiskUsageDeviceCollectionViewCell: CollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension DiskUsageDeviceCollectionViewCell {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension DiskUsageDeviceCollectionViewCell {
    func setup() {}

    func layout() {}
}

extension DiskUsageDeviceCollectionViewCell {
    func config(viewModel: DiskUsageDeviceViewModel) {}
}
