//
// Created by Mengyu Li on 2022/6/22.
//

import Foundation

protocol BridgeDelegate: AnyObject {
    typealias CompletionHandler = (Any?, Error?) -> Void
    func evaluateJavascript(javascript: String, completion: CompletionHandler?)
}

extension BridgeDelegate {
    func evaluateJavascript(javascript: String) {
        evaluateJavascript(javascript: javascript, completion: .none)
    }
}

class Bridger {
    private weak var delegate: Optional<Delegate>
    private var responseCallbacks = [String: Callback]()
    private var uniqueId = 0

    private var consoleCallback: Optional<ConsoleCallback> = .none

    var messageHandlers = [String: Handler]()

    init(delegate: Optional<Delegate>) { self.delegate = delegate }
}

extension Bridger {
    typealias Callback = JavascriptBridge.Callback
    typealias Handler = JavascriptBridge.Handler
    typealias Message = JavascriptBridge.Message
    typealias ConsoleCallback = JavascriptBridge.ConsoleCallback

    typealias Delegate = BridgeDelegate
}

extension Bridger {
    func register(consoleCallback: Optional<ConsoleCallback>) {
        self.consoleCallback = consoleCallback
    }
}

extension Bridger {
    func reset() {
        responseCallbacks.removeAll()
        uniqueId = 0
    }

    func send(handlerName: String, data: Optional<Any>, callback: Optional<Callback>) {
        var message = [String: Any]()
        message["handlerName"] = handlerName
        if data != nil {
            message["data"] = data
        }
        if callback != nil {
            uniqueId += 1
            let callbackID = "objc_cb_\(uniqueId)"
            responseCallbacks[callbackID] = callback
            message["callbackId"] = callbackID
        }
        dispatch(message: message)
    }

    func flush(messageQueueString: String) {
        guard let message = deserialize(messageJSON: messageQueueString) else {
            return
        }
        if let responseID = message["responseId"] as? String {
            guard let callback = responseCallbacks[responseID] else { return }
            callback(message["responseData"])
            responseCallbacks.removeValue(forKey: responseID)
        } else {
            var callback: Callback?
            if let callbackID = message["callbackId"] {
                callback = { (_ responseData: Optional<Any>) in
                    let msg = ["responseId": callbackID, "responseData": responseData ?? NSNull()] as Message
                    self.dispatch(message: msg)
                }
            } else {
                callback = { (_: Optional<Any>) in }
            }
            guard let handlerName = message["handlerName"] as? String else { return }
            guard let handler = messageHandlers[handlerName] else {
                print("NoHandlerException, No handler for message from JS: \(message)")
                return
            }
            handler(message["data"] as? [String: Any], callback)
        }
    }

    func console(data: Any) {
        consoleCallback.map { $0(data) }
    }
}

private extension Bridger {
    func dispatch(message: Message) {
        guard var messageJSON = serialize(message: message, pretty: false) else { return }

        messageJSON = messageJSON.replacingOccurrences(of: "\\", with: "\\\\")
        messageJSON = messageJSON.replacingOccurrences(of: "\"", with: "\\\"")
        messageJSON = messageJSON.replacingOccurrences(of: "\'", with: "\\\'")
        messageJSON = messageJSON.replacingOccurrences(of: "\n", with: "\\n")
        messageJSON = messageJSON.replacingOccurrences(of: "\r", with: "\\r")
        messageJSON = messageJSON.replacingOccurrences(of: "\u{000C}", with: "\\f")
        messageJSON = messageJSON.replacingOccurrences(of: "\u{2028}", with: "\\u2028")
        messageJSON = messageJSON.replacingOccurrences(of: "\u{2029}", with: "\\u2029")

        let javascriptCommand = "WebViewJavascriptBridge.handleMessageFromNative('\(messageJSON)');"
        if Thread.current.isMainThread {
            delegate?.evaluateJavascript(javascript: javascriptCommand)
        } else {
            DispatchQueue.main.async {
                self.delegate?.evaluateJavascript(javascript: javascriptCommand)
            }
        }
    }

    func serialize(message: Message, pretty: Bool) -> Optional<String> {
        var result: String?
        do {
            let data = try JSONSerialization.data(withJSONObject: message, options: pretty ? [.prettyPrinted] : [])
            result = String(data: data, encoding: .utf8)
        } catch {
            print(error)
        }
        return result
    }

    func deserialize(messageJSON: String) -> Optional<Message> {
        var result: Optional<Message> = .none
        guard let data = messageJSON.data(using: .utf8) else { return nil }
        do {
            result = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Message
        } catch {
            print(error)
        }
        return result
    }
}
