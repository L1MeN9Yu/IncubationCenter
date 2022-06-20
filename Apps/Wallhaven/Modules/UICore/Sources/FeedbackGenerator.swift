//
// Created by Mengyu Li on 2022/6/20.
//

import UIKit

public enum FeedbackGenerator {}

public extension FeedbackGenerator {
    static let impact = ImpactGenerator()
    static let selection = SelectionGenerator()
    static let notification = NotificationGenerator()
}
