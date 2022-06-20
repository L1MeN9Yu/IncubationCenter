//
// Created by Mengyu Li on 2022/6/20.
//

import UIKit

public class NotificationGenerator {
    private lazy var generator: UINotificationFeedbackGenerator = {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        return generator
    }()

    public init() {}
}

public extension NotificationGenerator {
    var shared: UINotificationFeedbackGenerator { generator }
}
