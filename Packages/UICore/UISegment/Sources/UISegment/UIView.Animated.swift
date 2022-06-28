//
// Created by Mengyu Li on 2022/6/27.
//

import UIKit

extension UIView {
    func perform(animated: Bool, action: @escaping () -> Void) {
        if animated {
            UIView.animate(withDuration: 0.25, animations: action)
        } else {
            action()
        }
    }
}
