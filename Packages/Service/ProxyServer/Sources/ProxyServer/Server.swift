//
// Created by Mengyu Li on 2022/6/10.
//

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
        hbServer = HBHTTPServer(group: NIOTSEventLoopGroup(), configuration: HBHTTPServer.Configuration(address: .hostname("0.0.0.0", port: Int(port)), serverName: "Wallhaven"))
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
        queue.async { [self] in
            lifeCycle.shutdown()
        }
    }
}
