//
// Created by Mengyu Li on 2022/6/28.
//

import Foundation
import UICore
import UIKit
import WeakDelegate

class FilterCollectionViewOrderCell: CollectionViewCell {
    private lazy var segmentControl = MultiSelectSegmentedControl()
        .x
        .tintColor(.systemBlack)
        .delegate(self)
        .instance

    private let valueUpdateDelegator = Delegator<(Int, Bool), Void>()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension FilterCollectionViewOrderCell {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension FilterCollectionViewOrderCell {
    func setup() {
        segmentControl.x.add(to: contentView)
    }

    func layout() {
        segmentControl.pin.all(16)
    }
}

extension FilterCollectionViewOrderCell {
    func config(viewModel: FilterItemViewModel) {
        let indexes: [Int] = viewModel.items.map(\.1).enumerated().compactMap { (offset: Int, element: Bool) -> Int? in
            if element { return offset }
            return nil
        }

        segmentControl
            .x
            .items(viewModel.items.map(\.0))
            .allowsMultipleSelection(viewModel.isMultiSelect)
            .selectedSegmentIndexes(IndexSet(indexes))
            .done

        viewModel.register(valueUpdateDelegator: valueUpdateDelegator)
    }
}

extension FilterCollectionViewOrderCell: MultiSelectSegmentedControlDelegate {
    func multiSelect(_ multiSelectSegmentedControl: MultiSelectSegmentedControl, didChange value: Bool, at index: Int) {
        valueUpdateDelegator((index, value))
    }
}
