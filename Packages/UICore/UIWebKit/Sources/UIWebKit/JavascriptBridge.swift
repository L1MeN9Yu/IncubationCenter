//
// Created by Mengyu Li on 2022/6/22.
//

import Foundation
import WebKit

public class JavascriptBridge {
    private weak var webView: Optional<WKWebView>
    private lazy var bridger = Bridger(delegate: .some(self))

    public init(webView: Optional<WKWebView>, additionJavascriptCode: Optional<String> = .none) {
        self.webView = webView

        addScriptMessageHandlers()
        injectJavascriptCode(additionJavascriptCode: additionJavascriptCode)
    }

    deinit {
        removeScriptMessageHandlers()
    }
}

public extension JavascriptBridge {
    typealias Callback = (_ responseData: Optional<Any>) -> Void
    typealias Handler = (_ parameters: Optional<[String: Any]>, _ callback: Optional<Callback>) -> Void
    typealias Message = [String: Any]
    typealias ConsoleCallback = (Any) -> Void
}

extension JavascriptBridge: Bridger.Delegate {
    func evaluateJavascript(javascript: String, completion: Optional<CompletionHandler>) {
        webView.map { $0.evaluateJavaScript(javascript, completionHandler: completion) }
    }
}

public extension JavascriptBridge {
    func register(handlerName: String, handler: @escaping Handler) {
        bridger.messageHandlers[handlerName] = handler
    }

    func register(consoleCallback: Optional<ConsoleCallback>) {
        bridger.register(consoleCallback: consoleCallback)
    }

    func remove(handlerName: String) -> Optional<Handler> {
        bridger.messageHandlers.removeValue(forKey: handlerName)
    }

    func call(handlerName: String, data: Optional<Any> = .none, callback: Optional<Callback> = .none) {
        bridger.send(handlerName: handlerName, data: data, callback: callback)
    }

    func reset() {
        bridger.reset()
    }
}

private extension JavascriptBridge {
    func injectJavascriptCode(additionJavascriptCode: Optional<String>) {
        let bridgeJS = JavascriptCode.bridge
        let hookConsoleJS = JavascriptCode.hookConsole
        let finalJS = "\(bridgeJS)" + "\(hookConsoleJS)"
        let userScript = WKUserScript(source: finalJS, injectionTime: .atDocumentStart, forMainFrameOnly: true)
        webView.map { $0.configuration.userContentController.addUserScript(userScript) }
        additionJavascriptCode.map {
            guard !$0.isEmpty else { return }
            let otherScript = WKUserScript(source: $0, injectionTime: .atDocumentStart, forMainFrameOnly: true)
            webView.map { $0.configuration.userContentController.addUserScript(otherScript) }
        }
    }

    func addScriptMessageHandlers() {
        PipeType.allCases.forEach {
            let messageHandler = MessageHandler(bridger: .some(bridger))
            let name = $0.rawValue
            webView.map { $0.configuration.userContentController.add(messageHandler, name: name) }
        }
    }

    func removeScriptMessageHandlers() {
        PipeType.allCases.forEach {
            let name = $0.rawValue
            webView.map { $0.configuration.userContentController.removeScriptMessageHandler(forName: name) }
        }
    }
}
