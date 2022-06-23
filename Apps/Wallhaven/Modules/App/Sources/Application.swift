//
// Created by Mengyu Li on 2022/5/20.
//

import AppWebBrowser
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
        registerRoute().registerUI().enterUI()
    }

    @discardableResult
    static func registerRoute() -> Self.Type {
        let routableList = AppTabBar.routableViewControllers +
            AppDiscovery.routableViewControllers +
            AppFavorite.routableViewControllers +
            AppMe.routableViewControllers +
            AppWallpaper.routableViewControllers +
            AppWebBrowser.routableViewControllers
        routableList.forEach {
            Router.register(routeName: $0.routeName, factory: $0.initialize)
        }

        let actionList = AppTabBar.actions +
            AppDiscovery.actions +
            AppFavorite.actions +
            AppMe.actions +
            AppWallpaper.actions
        actionList.forEach {
            Router.register(actName: $0.actName, action: $0.act)
        }
        return self
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
