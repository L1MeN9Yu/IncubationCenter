//
// Created by Mengyu Li on 2022/6/27.
//

import UIKit

extension UIView {
    var actualTintColor: UIColor {
        var tintedView: UIView? = self
        while let currentView = tintedView, currentView.tintColor == nil {
            tintedView = currentView.superview
        }
        return tintedView?.tintColor ?? UIColor(red: 0, green: 0.5, blue: 1, alpha: 1)
    }
}
