//
// Created by Mengyu Li on 2022/6/22.
//

import WebKit

class MessageHandler: NSObject {
    weak var bridger: Optional<Bridger>

    init(bridger: Optional<Bridger>) {
        self.bridger = bridger
        super.init()
    }
}

extension MessageHandler: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == PipeType.console.rawValue {
            bridger.map { $0.console(data: message.body) }
        } else if message.name == PipeType.normal.rawValue {
            guard let body = message.body as? String else { return }
            bridger.map { $0.flush(messageQueueString: body) }
        }
    }
}
