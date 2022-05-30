//
// Created by Mengyu Li on 2022/5/29.
//

import BaseUI
import Center
import Foundation

class WallpaperViewModel: ViewModel {
    let id: String
    private(set) var imageURL: URL?

    init(id: String) {
        self.id = id
        super.init()
    }
}

extension WallpaperViewModel {
    func update(model: WallpaperDetail) {
        let imageURL = URL(string: model.path)
        self.imageURL = imageURL
    }
}
