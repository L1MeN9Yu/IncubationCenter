//
// Created by Mengyu Li on 2022/6/10.
//

import AppModular
import Foundation
import UICore
import UIKit
import UIRoute

class APIKeyViewController: ViewController {
    private lazy var contentView = APIKeyContentView(frame: .zero)
    private lazy var viewModel = APIKeyViewModel()
    private lazy var provider = APIKeyProvider()

    init() { super.init(nibName: nil, bundle: nil) }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension APIKeyViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
    }
}

private extension APIKeyViewController {
    func setup() {
        title = MeModule.localizedString(key: "APIKeyViewController.Title")
        contentView.x.add(to: view)
        bind()

        Task { @MainActor in
            contentView.reloadData(viewModel: viewModel)
        }
    }

    func layout() {
        contentView.pin.all(view.pin.safeArea)
    }

    func bind() {}
}

extension APIKeyViewController: TypeNameable {}

extension APIKeyViewController: Routable {
    static func initialize(url: URLConvertible, values: [String: Any], context: Any?) -> UIViewController? {
        APIKeyViewController()
    }
}
