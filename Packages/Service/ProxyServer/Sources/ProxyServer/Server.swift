//
// Created by Mengyu Li on 2022/6/10.
//

import FlyingFox
import Foundation

public class Server {
    let httpServer: HTTPServer

    private let rootHandler = RootHandler()

    private var task: Task<Void, Error>?

    public init(port: UInt16) {
        httpServer = HTTPServer(port: port, handler: rootHandler)
    }
}

public extension Server {
    func start() {
        let task = Task {
            try await httpServer.start()
        }
        self.task = task
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
