//
// Created by Mengyu Li on 2022/5/20.
//

import UIBase
import UIKit
import UIExtensionsKit
import UIFeedback

class AppTabBarViewController: TabBarViewController {}

extension AppTabBarViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension AppTabBarViewController {
    func setup() {
        tabBar.tintColor = .systemBlack
        tabBar.isTranslucent = false
        delegate = self
    }
}

extension AppTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        FeedbackGenerator.selection.shared.selectionChanged()
    }
}
