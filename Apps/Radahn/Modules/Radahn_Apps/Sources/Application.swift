//
// Created by mengyu.li on 2022/12/22.
//

import PropertyWrappers
import UIKit
import AppModular
import LoggerPool
import UIBase
import UIRoute
import App_TabBar
import App_Boot

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
        switch diagnose() {
        case true:
            enterDiagnose()
        case false:
            enterBoot()
        }
    }

    static func diagnose() -> Bool {
        false
    }

    static func enterBoot() {
        App_Boot.register(bootComplete: bootComplete)
        window.rootViewController = App_Boot.bootViewControllerType.init()
    }

    static func enterDiagnose() {
        window.rootViewController = App_Boot.diagnoseViewControllerType.init()
    }

    static func bootComplete(result: Result<Void, Error>) {
        switch result {
        case .success:
            registerRoute().registerUI().enterUI()
        case let .failure(error):
            logger.error("\(error)")
        }
    }

    @discardableResult
    static func registerRoute() -> Self.Type {
        let routableList =
            App_TabBar.routableViewControllers
        routableList.forEach {
            Router.register(routeName: $0.routeName, factory: $0.initialize)
        }

        let actionList =
            App_TabBar.actions
        actionList.forEach {
            Router.register(actName: $0.actName, action: $0.act)
        }
        return self
    }

    @discardableResult
    static func registerUI() -> Self.Type {
        UIBase.register(
            viewWillAppearAction: {
                logger.trace("\($0) viewWillAppear")
            },
            viewWillDisappearAction: {
                logger.trace("\($0) viewWillDisappear")
            }
        )
        UIBase.register(viewControllerDeinitAction: {
            logger.debug("\($0) deinit")
        })
        return self
    }

    @discardableResult
    static func enterUI() -> Self.Type {
        window.rootViewController =
            App_TabBar.appTabBarViewControllerType.init(viewControllers: [
//            AppDiscovery.discoveryNavigationControllerType.init(),
//            AppFavorite.favoriteNavigationControllerType.init(),
//            AppMe.meNavigationControllerType.init(),
        ])
        return self
    }
}
