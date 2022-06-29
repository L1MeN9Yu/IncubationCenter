//
// Created by Mengyu Li on 2022/6/29.
//

import BaseUI
import Foundation

class BootViewController: ViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension BootViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
}

private extension BootViewController {
    func setup() {}

    func layout() {}
}
