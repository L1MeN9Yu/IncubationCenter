//
// Created by Mengyu Li on 2022/5/20.
//

import UICore

class MeViewController: ViewController {
    private lazy var viewModel = MeViewModel()
    private lazy var contentView = MeContentView()
}

extension MeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
    }
}

private extension MeViewController {
    func setup() {
        title = MeModule.localizedString(key: "MeViewController.Title")
        contentView.x.add(to: view)
        Task { @MainActor in
            contentView.reloadData(viewModel: viewModel)
        }
        bind()
    }

    func layout() {
        contentView.pin.all(view.pin.safeArea)
    }

    func bind() {
        contentView.didSelectedItemDelegator.delegate(on: self) { _, indexPath in
            switch (indexPath.section, indexPath.row) {
            case (0, 0): Router.push(to: "APIKeyViewController")
            case (3, 0): Router.push(to: "AboutViewController")
            default: return
            }
        }
    }
}
