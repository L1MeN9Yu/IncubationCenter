//
// Created by Mengyu Li on 2022/7/1.
//

import UIBase
import Chain
import Foundation
import UIKit
import UILayout

class DiskUsageDeviceCollectionViewCell: CollectionViewCell {
    private lazy var totalView: View = .init(frame: .zero)
        .x
        .backgroundColor(.systemGray6)
        .instance

    private lazy var usedView: View = .init(frame: .zero)
        .x
        .backgroundColor(.systemGray3)
        .instance

    private lazy var appView: View = .init(frame: .zero)
        .x
        .backgroundColor(.systemBlack)
        .instance

    private lazy var totalIconView: View = .init(frame: .zero)
        .x
        .backgroundColor(.systemGray6)
        .instance

    private lazy var totalIconLabel: UILabel = .init(frame: .zero)
        .x
        .textColor(.systemGray2)
        .font(.preferredFont(forTextStyle: .caption2))
        .instance

    private lazy var usedIconView: View = .init(frame: .zero)
        .x
        .backgroundColor(.systemGray3)
        .instance

    private lazy var usedIconLabel: UILabel = .init(frame: .zero)
        .x
        .textColor(.systemGray2)
        .font(.preferredFont(forTextStyle: .caption2))
        .instance

    private lazy var appIconView: View = .init(frame: .zero)
        .x
        .backgroundColor(.systemBlack)
        .instance

    private lazy var appIconLabel: UILabel = .init(frame: .zero)
        .x
        .textColor(.systemGray2)
        .font(.preferredFont(forTextStyle: .caption2))
        .instance

    private var usedPercent = 0%
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
        usedView.x.add(to: totalView)
        totalIconView.x.add(to: contentView)
        usedIconView.x.add(to: contentView)
        appIconView.x.add(to: contentView)
        totalIconLabel.x.add(to: contentView)
        usedIconLabel.x.add(to: contentView)
        appIconLabel.x.add(to: contentView)
        totalIconLabel.x.text(Module.localizedString(key: "DiskUsageViewController.Device.Cell.TotalIconText")).done
        usedIconLabel.x.text(Module.localizedString(key: "DiskUsageViewController.Device.Cell.UsedIconText")).done
        appIconLabel.x.text(Module.localizedString(key: "DiskUsageViewController.Device.Cell.AppIconText")).done
    }

    func layout() {
        totalView.pin.top().left().right().margin(8).height(20)
        appView.pin.top().left().bottom().width(appPercent)
        usedView.pin.top().right(of: appView).bottom().width(usedPercent)
        totalIconView.pin.left().margin(8).below(of: totalView).width(10).height(10)
        usedIconView.pin.left().margin(8).below(of: totalIconView).width(10).height(10)
        appIconView.pin.left().margin(8).below(of: usedIconView).width(10).height(10)
        totalIconLabel.pin.right(of: totalIconView, aligned: .center).margin(0, 8, 0, 0).sizeToFit(.content)
        usedIconLabel.pin.right(of: usedIconView, aligned: .center).margin(0, 8, 0, 0).sizeToFit(.content)
        appIconLabel.pin.right(of: appIconView, aligned: .center).margin(0, 8, 0, 0).sizeToFit(.content)
    }
}

extension DiskUsageDeviceCollectionViewCell {
    func config(viewModel: DiskUsageDeviceViewModel) {
        usedPercent = (viewModel.usedPercent * 100)%
        appPercent = (viewModel.appPercent * 100)%

        setNeedsLayout()
    }
}
