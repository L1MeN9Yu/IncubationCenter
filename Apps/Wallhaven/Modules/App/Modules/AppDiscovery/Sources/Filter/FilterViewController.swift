//
// Created by Mengyu Li on 2022/6/27.
//

import Foundation
import UICore
import UIKit

class FilterViewController: ViewController {
    private lazy var subscriptions = Set<AnyCancellable>()

    private lazy var contentView = FilterContentView()
    private lazy var viewModel = FilterViewModel()
    private lazy var provider = FilterProvider()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension FilterViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
    }
}

private extension FilterViewController {
    func setup() {
        title = DiscoveryModule.localizedString(key: "FilterViewController.Title")
        contentView.x.add(to: view)
        Task { @MainActor in
            let filter = await provider.loadFilter()
            viewModel.updateFilter(filter)
            contentView.reloadData(viewModel: viewModel)
        }

        let okButton = UIBarButtonItem(title: Module.localizedString(key: "FilterViewController.OKButton.Title"), style: .plain, target: nil, action: nil)
        okButton
            .tapPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.okButtonAction()
            }
            .store(in: &subscriptions)
        navigationItem.rightBarButtonItems = [
            okButton,
        ]
    }

    func layout() {
        contentView.pin.all(view.pin.safeArea)
    }
}

private extension FilterViewController {
    func okButtonAction() {
        let filter = viewModel.exportFilter()
        provider.saveFilter(filter)
        navigationController.run { $0.popViewController(animated: true) }
    }
}

extension FilterViewController: Routable {
    class func initialize(url: URLConvertible, values: [String: Any], context: Any?) -> UIViewController? {
        FilterViewController()
    }
}
