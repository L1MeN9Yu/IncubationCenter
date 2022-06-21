//
// Created by Mengyu Li on 2022/5/29.
//

import AppModular
import ExtensionKit
import UICore
import UIKit

class WallpaperViewController: ViewController {
    private let viewModel: WallpaperViewModel
    private lazy var contentView = WallpaperContentView(frame: .zero)
    private lazy var provider = WallpaperProvider()

    init(id: String) {
        viewModel = WallpaperViewModel(id: id)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

// MARK: - Override

extension WallpaperViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        contentView.pin.all()
    }
}

private extension WallpaperViewController {
    func setup() {
        contentView.x.add(to: view)
        Task {
            await loadData()
            contentView.reloadData(viewModel: viewModel)
        }
    }

    func loadData() async {
        do {
            let detailResponse = try await provider.loadDetail(id: viewModel.id)
            viewModel.update(model: detailResponse.wallpaper)
        } catch {
            logger.error("\(error)")
        }
    }
}

extension WallpaperViewController: TypeNameable {}

extension WallpaperViewController: Routable {
    class func initialize(url: URLConvertible, values: [String: Any], context: Any?) -> UIViewController? {
        guard let id = values["id"] as? String else { return nil }
        return WallpaperViewController(id: id)
    }

    static let routeName: String = typeName + "/<string:id>"
}
