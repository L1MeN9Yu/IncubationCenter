//
// Created by Mengyu Li on 2022/5/20.
//

import UICore

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
    }
}
