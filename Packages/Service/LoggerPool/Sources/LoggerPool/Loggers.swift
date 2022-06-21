//
// Created by Mengyu Li on 2021/1/26.
//

import Locks
@_exported import Logging
@_exported import Senna

public enum Loggers {}

private extension Loggers {
    static var loggers = [String: Logging.Logger]()
}

extension Loggers {
    static let lock = ReadWriteLock()
}

public extension Loggers {
    static subscript(name: String) -> Logging.Logger {
        set { fatalError("Unavailable") }
        get {
            let logger =
                lock.withReaderLock {
                    loggers[name]
                }
                ??
                lock.withWriterLock {
                    let logger = make(name: name)
                    loggers[name] = logger
                    return logger
                }
            return logger
        }
    }
}

private extension Loggers {
    static func make(name: String) -> Logging.Logger {
        Logger(label: name) { Handler(name: $0, sink: StandardSink.out(flushMode: .always), formation: Formation.standard, logLevel: .trace) }
    }
}
