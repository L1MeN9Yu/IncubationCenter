//
// Created by Mengyu Li on 2022/5/23.
//

import Foundation
import UICore

class FavoriteNavigationController: NavigationController {
    init() {
        super.init(rootViewController: FavoriteViewController(nibName: nil, bundle: nil))
        setup()
    }
}

private extension FavoriteNavigationController {
    func setup() {
        tabBarItem = .init(title: FavoriteModule.localizedString(key: "FavoriteViewController.Title"), image: .init(systemName: "star"), selectedImage: .init(systemName: "star.fill"))
        navigationBar.tintColor = .systemBlack
    }
}
