//
// Created by Mengyu Li on 2022/5/29.
//

#if canImport(UIKit)

import UIKit

public enum Router {}

private extension Router {
    static let navigator = URLRouter()
    static let scheme: String = {
        let bundleName: String = (Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String).unsafelyUnwrapped
        return bundleName + "://"
    }()
}

public extension Router {
    static func register(routeName: String, factory: @escaping ViewControllerFactory) {
        let urlPattern = scheme + routeName
        navigator.register(urlPattern) { url, values, context in
            factory(url, values, context)
        }
    }

    static func register(actName: String, action: @escaping URLOpenHandlerFactory) {
        let urlPattern = scheme + actName
        navigator.handle(urlPattern) { url, values, context in
            action(url, values, context)
        }
    }
}

public extension Router {
    static func open(url: URL) {
        navigator.open(url)
    }

    static func push(to pattern: String) {
        let urlPattern = scheme + pattern
        navigator.push(urlPattern)
    }

    static func present(pattern: String) {
        let urlPattern = scheme + pattern
        navigator.present(urlPattern)
    }
}

#endif
