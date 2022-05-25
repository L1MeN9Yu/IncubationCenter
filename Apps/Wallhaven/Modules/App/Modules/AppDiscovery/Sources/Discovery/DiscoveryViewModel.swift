//
// Created by Mengyu Li on 2022/5/24.
//

import Center
import Foundation
import UICore

class DiscoveryViewModel: ViewModel {
    private(set) lazy var wallpaperListViewModels: [WallpaperListViewModel] = .init()
}

extension DiscoveryViewModel {
    func reload(wallpapers: [Wallpaper]) {
        let wallpaperListViewModels = wallpapers.map {
            WallpaperListViewModel(model: $0)
        }
        self.wallpaperListViewModels.removeAll()
        self.wallpaperListViewModels.append(contentsOf: wallpaperListViewModels)
    }

    func append(wallpapers: [Wallpaper]) {}
}
