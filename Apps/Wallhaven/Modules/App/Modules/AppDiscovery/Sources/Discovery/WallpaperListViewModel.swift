//
// Created by Mengyu Li on 2022/5/24.
//

import Center
import Foundation
import UICore

class WallpaperListViewModel: ViewModel {
    let id: String
    let imageURL: URL?

    init(model: Wallpaper) {
        id = model.id
        imageURL = URL(string: model.thumbnail.large)
    }
}

extension WallpaperListViewModel: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: WallpaperListViewModel, rhs: WallpaperListViewModel) -> Bool {
        lhs.id == rhs.id
    }
}
