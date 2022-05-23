//
// Created by Mengyu Li on 2022/5/20.
//

import AppDiscovery
import AppFavorite
import AppMe
import AppTabBar
import Foundation
import Service
import UICore
import UIKit

public enum Application {}

extension Application: TypeNameable {}

public extension Application {
    static let logger = Loggers[typeName]

    @DelayInit
    private(set) static var window: UIWindow
}

public extension Application {
    static func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) -> UIWindow? {
        guard let windowScene = (scene as? UIWindowScene) else { return nil }
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        self.window = window
        defer { setup() }
        return window
    }
}

private extension Application {
    static func setup() {
        registerUI().enterUI()
    }

    @discardableResult
    static func registerUI() -> Self.Type {
        BaseUI.register(
            viewWillAppearAction: {
                logger.trace("\($0) viewWillAppear")
            },
            viewWillDisappearAction: {
                logger.trace("\($0) viewWillDisappear")
            }
        )
        BaseUI.register(viewControllerDeinitAction: {
            logger.debug("\($0) deinit")
        })
        return self
    }

    @discardableResult
    static func enterUI() -> Self.Type {
        window.rootViewController = AppTabBar.appTabBarViewControllerType.init(viewControllers: [
            AppDiscovery.discoveryNavigationControllerType.init(),
            AppFavorite.favoriteNavigationControllerType.init(),
            AppMe.meNavigationControllerType.init(),
        ])
        return self
    }
}
