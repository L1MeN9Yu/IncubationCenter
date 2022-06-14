//
// Created by Mengyu Li on 2022/6/10.
//

import FlyingFox
import Foundation
import HummingbirdCore
import HummingbirdTLS
import Lifecycle
import LifecycleNIOCompat
import Logging
import NIO
import NIOTransportServices

public class Server {
    private let logger: Logger

    let httpServer: HTTPServer
    private let rootHandler = RootHandler()
    private var task: Task<Void, Error>?

    private let queue = DispatchQueue(label: "Wallhaven.Server")
    private let callbackQueue = DispatchQueue(label: "Wallhaven.Server.Callback")

    private let lifeCycle: ServiceLifecycle
    private let hbServer: HBHTTPServer
    private let rootResponder: RootResponder
    private let clientHandler: ClientHandle

    public init(port: UInt16, logger: Logger, clientHandler: ClientHandle) {
        self.logger = logger
        self.clientHandler = clientHandler

        lifeCycle = ServiceLifecycle(configuration: ServiceLifecycle.Configuration(label: "Wallhaven.Server", logger: logger, callbackQueue: callbackQueue))
        httpServer = HTTPServer(port: port, handler: rootHandler)
        hbServer = HBHTTPServer(group: NIOTSEventLoopGroup(), configuration: HBHTTPServer.Configuration(address: .hostname("0.0.0.0", port: Int(port + 1)), serverName: "Wallhaven"))
        rootResponder = RootResponder(logger: logger, clientHandler: clientHandler)

        lifeCycle.register(
            label: "Wallhaven.Server",
            start: .eventLoopFuture { [self] in hbServer.start(responder: rootResponder) },
            shutdown: .eventLoopFuture { [self] in hbServer.stop() }
        )
        /**
         do {
             try hbServer.addTLS(tlsConfiguration: .makeServerConfiguration(certificateChain: <#T##[NIOSSLCertificateSource]##[NIOSSL.NIOSSLCertificateSource]#>, privateKey: <#T##NIOSSLPrivateKeySource##NIOSSL.NIOSSLPrivateKeySource#>))
         } catch {
             fatalError("\(error)")
         }
          */
    }
}

public extension Server {
    func start() {
        let task = Task {
            try await httpServer.start()
        }
        self.task = task

        queue.async { [self] in
            lifeCycle.start { [self] error in
                if let error = error {
                    logger.error("\(error)")
                }
            }
            lifeCycle.wait()
        }
    }

    func stop() {
        task?.cancel()
    }
}

public extension Server {
    @available(*, unavailable)
    func enableSandboxBrowsing(pattern: String = "/browsing/sandbox/*") async throws {
        let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("../").standardized
        await httpServer.appendRoute(HTTPRoute(method: .GET, path: pattern), to: DirectoryHTTPHandler(root: url, serverPath: pattern))
    }

    @available(*, unavailable)
    func enableBundleBrowsing(pattern: String = "/browsing/bundle/*") async {
        let url = Bundle.main.bundleURL
        await httpServer.appendRoute(HTTPRoute(method: .GET, path: pattern), to: DirectoryHTTPHandler(root: url, serverPath: pattern))
    }
}
