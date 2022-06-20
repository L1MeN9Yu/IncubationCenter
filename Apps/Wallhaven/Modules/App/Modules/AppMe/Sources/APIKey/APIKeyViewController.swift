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

    private var checkingAPIKeyTask: Task<Void, Never>? = .none

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

    func bind() {
        contentView.didSelectedItemDelegate.delegate(on: self) { (`self`, indexPath: IndexPath) in
            guard let section = APIKeySection(section: indexPath.section) else { return }
            guard let item = self.viewModel.items[section]?[safe: indexPath.row] else { return }
            switch item {
            case let .about(viewModel):
                Router.push(to: viewModel.routePattern)
            default: return
            }
        }
    }
}

extension APIKeyViewController {
    func resetButtonAction() {
        logger.debug("reset")
    }

    func setButtonAction(apikey: String?) {
        guard let apikey = apikey else { return }
        guard !apikey.isEmpty else { return }
        checkingAPIKeyTask.run { $0.cancel() }
        let task = Task { @MainActor in
            do {
                logger.debug("checking apikey:\(apikey)")
                let settings = try await provider.check(apikey: apikey)
                logger.debug("\(settings)")
            } catch {
                // ToDo [L1MeN9Yu] Toast
                logger.error("\(error)")
            }
        }
        checkingAPIKeyTask = task
    }
}

extension APIKeyViewController: TypeNameable {}

extension APIKeyViewController: Routable {
    static func initialize(url: URLConvertible, values: [String: Any], context: Any?) -> UIViewController? {
        APIKeyViewController()
    }
}
