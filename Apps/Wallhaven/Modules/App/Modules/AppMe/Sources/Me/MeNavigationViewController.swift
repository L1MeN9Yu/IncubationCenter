//
// Created by Mengyu Li on 2022/5/20.
//

import UICore

class MeNavigationViewController: NavigationController {
    init() {
        super.init(rootViewController: MeViewController(nibName: nil, bundle: nil))
        setup()
    }
}

private extension MeNavigationViewController {
    func setup() {
        tabBarItem = .init(title: MeModule.localizedString(key: "MeViewController.Title"), image: .init(systemName: "person"), selectedImage: .init(systemName: "person.fill"))
        navigationBar.tintColor = .systemBlack
    }
}
