//
// Created by Mengyu Li on 2022/6/27.
//

#if canImport(UIKit)

import UIKit

public extension UIStackView {
    func removeArrangedSubviewCompletely(_ subview: UIView) {
        removeArrangedSubview(subview)
        subview.removeFromSuperview()
    }

    func removeAllArrangedSubviewsCompletely() {
        arrangedSubviews.reversed().forEach {
            removeArrangedSubviewCompletely($0)
        }
    }
}

#endif
