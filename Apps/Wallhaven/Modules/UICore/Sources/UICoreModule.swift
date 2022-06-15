//
// Created by Mengyu Li on 2022/5/19.
//

import Service

public enum UICoreModule {}

public extension UICoreModule {
    static func bootstrap() {
        Router
            .register(viewControllerRegisterCallback: {
                routerLogger.debug("ViewController registered => \($0)")
            })
            .register(urlHandleRegisterCallback: {
                routerLogger.debug("URLHandler registered => \($0)")
            })
            .register(viewControllerNotFoundCallback: {
                routerLogger.error("no view controller for \($0)")
            })

        AsyncImageManager.setupProxy(host: "127.0.0.1", port: 9528).setupCache()
    }
}

private extension UICoreModule {
    static let routerLogger = Loggers[String(describing: Router.self)]
}
