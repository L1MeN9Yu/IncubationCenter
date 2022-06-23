//
// Created by Mengyu Li on 2022/6/22.
//

import Foundation
import UICore
import UIKit
import WebKit

class WebBrowserContentView: View {
    private lazy var webView: WKWebView = {
        let configuration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()

    private lazy var bridge = JavascriptBridge(webView: webView)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension WebBrowserContentView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension WebBrowserContentView {
    func setup() {
        backgroundColor = .systemWhite
        webView.x.add(to: self)
        bridge.register { any in
            logger.debug("\(any)")
        }
    }

    func layout() {
        webView.pin.all(pin.safeArea)
    }
}

extension WebBrowserContentView {
    func reloadData(viewModel: WebBrowserViewModel) {
        let request = URLRequest(url: viewModel.url)
        webView.load(request)
    }
}
