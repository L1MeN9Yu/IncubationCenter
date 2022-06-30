//
// Created by Mengyu Li on 2022/6/30.
//

import BaseUI
import Foundation
import UIKit
import UIRoute

class DiskUsageViewController: ViewController {
    private lazy var contentView = DiskUsageContentView(frame: .zero)

    init() { super.init(nibName: nil, bundle: nil) }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension DiskUsageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout()
    }
}

private extension DiskUsageViewController {
    func setup() {
        title = MeModule.localizedString(key: "DiskUsageViewController.Title")
        contentView.x.add(to: view)
    }

    func layout() {
        contentView.pin.all(view.pin.safeArea)
    }
}

extension DiskUsageViewController: Routable {
    static func initialize(url: URLConvertible, values: [String: Any], context: Any?) -> UIViewController? {
        DiskUsageViewController()
    }
}
