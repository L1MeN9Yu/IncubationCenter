//
// Created by Mengyu Li on 2022/6/29.
//

import BaseUI
import Chain
import ExtensionKit
import Foundation
import UILayout

class BootViewController: ViewController {
    private lazy var contentView = BootContentView(frame: .zero)
    private lazy var bootQueue = DispatchQueue(label: Module.typeName)

    init() { super.init(nibName: nil, bundle: nil) }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension BootViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
    }
}

private extension BootViewController {
    func setup() {
        contentView.x.add(to: view)

        bootstrap()
    }

    func layout() {
        contentView.pin.all(view.pin.safeArea)
    }

    func bootstrap() {
        bootQueue.async {
            let result = Module.boot()
            DispatchQueue.main.async {
                Module.bootComplete.run { $0(result) }
            }
        }
    }
}
