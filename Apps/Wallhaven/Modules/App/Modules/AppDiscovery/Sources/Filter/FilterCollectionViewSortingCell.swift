//
// Created by Mengyu Li on 2022/6/28.
//

import Foundation
import UICore
import UIKit

class FilterCollectionViewSortingCell: CollectionViewCell {
    private lazy var segmentControl = MultiSelectSegmentedControl(
        items: [
            "general",
            "anime",
            "people",
        ]
    )
    .x
    .tintColor(.systemBlack)
    .instance

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension FilterCollectionViewSortingCell {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension FilterCollectionViewSortingCell {
    func setup() {
        segmentControl.x.add(to: contentView)
    }

    func layout() {
        segmentControl.pin.all(16)
    }
}

extension FilterCollectionViewSortingCell {
    func config(viewModel: FilterItemViewModel) {}
}
