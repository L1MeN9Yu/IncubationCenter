//
// Created by Mengyu Li on 2022/6/27.
//

import Foundation
import UICore
import UIKit

class FilterViewController: ViewController {
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
            contentView.reloadData(viewModel: viewModel)
        }
    }

    func layout() {
        contentView.pin.all(view.pin.safeArea)
    }
}

extension FilterViewController: Routable {
    class func initialize(url: URLConvertible, values: [String: Any], context: Any?) -> UIViewController? {
        FilterViewController()
    }
}
