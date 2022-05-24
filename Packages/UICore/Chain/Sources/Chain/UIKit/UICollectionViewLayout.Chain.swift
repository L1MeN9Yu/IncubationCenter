//
// Created by Mengyu Li on 2022/5/24.
//

#if canImport(UIKit)

import UIKit.UICollectionViewLayout

extension UICollectionViewLayout: Compatible {}

public extension Box where T: UICollectionViewLayout {}

#endif
