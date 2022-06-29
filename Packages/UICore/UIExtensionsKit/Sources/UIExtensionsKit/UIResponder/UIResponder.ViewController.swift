//
// Created by Mengyu Li on 2022/6/17.
//

#if canImport(UIKit)
import UIKit

public extension UIResponder {
    var parentViewController: UIViewController? {
        next as? UIViewController ?? next?.parentViewController
    }
}

#endif
