//
// Created by Mengyu Li on 2022/5/24.
//

import Center
import Foundation
import UICore

class DiscoveryViewModel: ViewModel {
    private(set) lazy var wallpaperListViewModels: [WallpaperListViewModel] = .init()
    private(set) var index: UInt = 1
}

extension DiscoveryViewModel {
    func update(response: ListResponse, isRefresh: Bool) {
        let wallpaperListViewModels = response.wallpapers.map {
            WallpaperListViewModel(model: $0)
        }
        if isRefresh {
            self.wallpaperListViewModels.removeAll()
        }
        index = response.meta.currentPage
        self.wallpaperListViewModels.append(contentsOf: wallpaperListViewModels)
    }
}
