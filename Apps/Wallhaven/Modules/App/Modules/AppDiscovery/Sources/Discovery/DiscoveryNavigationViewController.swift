//
// Created by Mengyu Li on 2022/5/20.
//

import Foundation
import UICore

class DiscoveryNavigationViewController: NavigationController {
    init() {
        super.init(rootViewController: DiscoveryViewController(nibName: nil, bundle: nil))
        setup()
    }
}

private extension DiscoveryNavigationViewController {
    func setup() {
        tabBarItem = .init(title: DiscoveryModule.localizedString(key: "DiscoveryViewController.Title"), image: .init(systemName: "house"), selectedImage: .init(systemName: "house.fill"))
        navigationBar.tintColor = .systemBlack
    }
}
