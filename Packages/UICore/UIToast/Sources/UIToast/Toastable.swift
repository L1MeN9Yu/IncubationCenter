//
// Created by Mengyu Li on 2022/6/21.
//

import Foundation
import UIKit

public protocol Toastable: UIView {
    func createView(for toast: Toast)
}
