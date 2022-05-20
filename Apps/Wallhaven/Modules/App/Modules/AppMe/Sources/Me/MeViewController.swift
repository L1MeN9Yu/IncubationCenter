//
// Created by Mengyu Li on 2022/5/20.
//

import UICore

class MeViewController: ViewController {
    private lazy var contentView = MeContentView()
}

extension MeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension MeViewController {
    func setup() {
        setupNavigationBar()
        contentView.x.add(to: view).pin.all()
    }

    func setupNavigationBar() {
        title = MeModule.localizedString(key: "MeViewController.Title")
    }
}
