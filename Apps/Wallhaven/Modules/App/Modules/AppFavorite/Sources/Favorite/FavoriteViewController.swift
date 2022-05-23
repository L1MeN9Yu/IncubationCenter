//
// Created by Mengyu Li on 2022/5/23.
//

import Foundation
import UICore

class FavoriteViewController: ViewController {}

extension FavoriteViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension FavoriteViewController {
    func setup() {
        setupNavigationBar()
    }

    func setupNavigationBar() {
        title = FavoriteModule.localizedString(key: "FavoriteViewController.Title")
    }
}
