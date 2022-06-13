//
// Created by Mengyu Li on 2022/6/13.
//

import Foundation
import Kingfisher

public enum AsyncImageManager {}

public extension AsyncImageManager {
    @discardableResult
    static func setupProxy(host: String, port: UInt16) -> Self.Type {
        let httpProxyKey = kCFNetworkProxiesHTTPEnable as String
        let httpHostKey = kCFNetworkProxiesHTTPProxy as String
        let httpPortKey = kCFNetworkProxiesHTTPPort as String
        let httpsProxyKey = "HTTPSEnable"
        let httpsHostKey = "HTTPSProxy"
        let httpsPortKey = "HTTPSPort"

        let sessionConfiguration = URLSessionConfiguration.ephemeral
        let connectionProxyDictionary: [AnyHashable: Any] = [
            httpProxyKey: true,
            httpHostKey: host,
            httpPortKey: port,
            httpsProxyKey: true,
            httpsHostKey: host,
            httpsPortKey: port,
        ]
        sessionConfiguration.connectionProxyDictionary = connectionProxyDictionary
        KingfisherManager.shared.downloader.sessionConfiguration = sessionConfiguration
        KingfisherManager.shared.defaultOptions = [
            .requestModifier(AnyModifier { request in
                guard let url = request.url else { return request }
                guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return request }
                urlComponents.scheme = "http"
                var modifiedRequest = request
                modifiedRequest.url = urlComponents.url
                return modifiedRequest
            }),
        ]
        return self
    }

    @discardableResult
    static func setupCache() -> Self.Type {
        do {
            let name = String(describing: self)
            let cacheDirectoryURL: URL = try FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(name)
            let imageCache = try ImageCache(name: name, cacheDirectoryURL: cacheDirectoryURL)
            KingfisherManager.shared.cache = imageCache
        } catch {
            fatalError("\(error)")
        }
        return self
    }
}
