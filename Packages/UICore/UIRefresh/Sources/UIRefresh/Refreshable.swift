//
// Created by Mengyu Li on 2022/5/25.
//

#if canImport(UIKit)
import UIKit

public protocol Refreshable where Self: UIView {
    func animate(state: Refresher.State)
}
#endif
