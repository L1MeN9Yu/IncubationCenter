//
// Created by Mengyu Li on 2022/7/1.
//

import BaseUI
import Chain
import Foundation
import UIKit
import UILayout

class DiskUsageDeviceCollectionViewCell: CollectionViewCell {
    private lazy var totalView: View = .init(frame: .zero)
        .x
        .backgroundColor(.systemGray6)
        .instance

    private lazy var availableView: View = .init(frame: .zero)
        .x
        .backgroundColor(.systemGray3)
        .instance

    private lazy var appView: View = .init(frame: .zero)
        .x
        .backgroundColor(.systemBlack)
        .instance

    private var availablePercent = 0%
    private var appPercent = 0%

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
    func setup() {
        totalView.x.add(to: contentView)
        appView.x.add(to: totalView)
        availableView.x.add(to: totalView)
    }

    func layout() {
        totalView.pin.top().left().right().margin(8).height(20)
        appView.pin.top().left().bottom().width(appPercent)
        availableView.pin.top().right(of: appView).bottom().width(availablePercent)
    }
}

extension DiskUsageDeviceCollectionViewCell {
    func config(viewModel: DiskUsageDeviceViewModel) {
        availablePercent = (viewModel.availablePercent * 100)%
        appPercent = (viewModel.appPercent * 100)%

        setNeedsLayout()
    }
}
