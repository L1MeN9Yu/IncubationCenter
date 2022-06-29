//
// Created by Mengyu Li on 2022/6/29.
//

public protocol MultiSelectSegmentedControlDelegate: AnyObject {
    func multiSelect(_ multiSelectSegmentedControl: MultiSelectSegmentedControl, didChange value: Bool, at index: Int)
}
