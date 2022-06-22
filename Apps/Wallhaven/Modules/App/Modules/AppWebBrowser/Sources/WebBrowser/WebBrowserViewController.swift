//
// Created by Mengyu Li on 2022/6/22.
//

import Foundation
import Service
import UICore
import UIKit

class WebBrowserViewController: ViewController {
    private let viewModel: WebBrowserViewModel
    private lazy var contentView = WebBrowserContentView(frame: .zero)

    init(url: URL) {
        viewModel = WebBrowserViewModel(url: url)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension WebBrowserViewController: TypeNameable {}

extension WebBrowserViewController: Routable {
    class func initialize(url: URLConvertible, values: [String: Any], context: Any?) -> UIViewController? {
        guard let urlString = values["urlString"] as? String else { return nil }
        guard let url = URL(string: urlString) else { return nil }
        return WebBrowserViewController(url: url)
    }

    static let routeName: String = typeName + "/<string:urlString>"
}
