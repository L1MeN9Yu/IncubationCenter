//
// Created by Mengyu Li on 2022/6/20.
//

import UIKit

@available(iOS 10.0, *)
public class NotificationGenerator {
    private lazy var generator: UINotificationFeedbackGenerator = {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        return generator
    }()

    public init() {}
}

@available(iOS 10.0, *)
public extension NotificationGenerator {
    var shared: UINotificationFeedbackGenerator { generator }
}
