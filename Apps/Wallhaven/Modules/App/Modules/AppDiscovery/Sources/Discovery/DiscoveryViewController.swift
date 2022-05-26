//
// Created by Mengyu Li on 2022/5/20.
//

import Foundation
import UICore

class DiscoveryViewController: ViewController {
    private lazy var subscriptions = Set<AnyCancellable>()
    private lazy var contentView = DiscoveryContentView()
    private lazy var provider = DiscoveryProvider()
    private lazy var viewModel = DiscoveryViewModel()
}

extension DiscoveryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        contentView.pin.all(view.pin.safeArea)
    }
}

private extension DiscoveryViewController {
    func setup() {
        setupNavigationBar()
        contentView.x.add(to: view)
        contentView.headerRefreshDelegate.delegate(on: self) { (`self`, refresher: Refresher) in
            Task { [weak refresher, weak self] in
                guard let self = self else { return }
                guard let refresher = refresher else { return }
                await self.loadData(isRefresh: true)
                refresher.endRefreshing()
                self.contentView.reloadData(viewModel: self.viewModel)
            }
        }
        contentView.footerRefreshDelegate.delegate(on: self) { (`self`, refresher: Refresher) in
            Task { [weak refresher, weak self] in
                guard let self = self else { return }
                guard let refresher = refresher else { return }
                await self.loadData(isRefresh: false)
                refresher.endRefreshing()
                self.contentView.reloadData(viewModel: self.viewModel)
            }
        }
    }

    func setupNavigationBar() {
        title = DiscoveryModule.localizedString(key: "DiscoveryViewController.Title")
        let filterBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: nil, action: nil)
        filterBarButtonItem
            .tapPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.filterBarButtonItemAction()
            }
            .store(in: &subscriptions)
        navigationItem.rightBarButtonItem = filterBarButtonItem
    }

    func loadData(isRefresh: Bool) async {
        do {
            let listResponse = try await provider.loadList()
            viewModel.update(response: listResponse, isRefresh: isRefresh)
        } catch {
            logger.error("\(error)")
        }
    }
}

private extension DiscoveryViewController {
    func filterBarButtonItemAction() {}
}
