//
// Created by Mengyu Li on 2022/5/20.
//

import Foundation
import UICore

class DiscoveryViewController: ViewController {
    private lazy var subscriptions = Set<AnyCancellable>()
    private lazy var contentView = DiscoveryContentView()
}

extension DiscoveryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension DiscoveryViewController {
    func setup() {
        setNavigationBar()
        contentView.x.add(to: view).pin.all()
    }

    func setNavigationBar() {
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
}

private extension DiscoveryViewController {
    func filterBarButtonItemAction() {}
}
