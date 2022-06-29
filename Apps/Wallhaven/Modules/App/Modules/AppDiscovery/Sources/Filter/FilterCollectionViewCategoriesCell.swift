//
// Created by Mengyu Li on 2022/6/27.
//

import Foundation
import UICore
import UIKit

class FilterCollectionViewCategoriesCell: CollectionViewCell {
    private lazy var segmentControl: MultiSelectSegmentedControl = .init()
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

extension FilterCollectionViewCategoriesCell {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension FilterCollectionViewCategoriesCell {
    func setup() {
        segmentControl.x.add(to: contentView)
    }

    func layout() {
        segmentControl.pin.all(16)
    }
}

extension FilterCollectionViewCategoriesCell {
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
    }
}
