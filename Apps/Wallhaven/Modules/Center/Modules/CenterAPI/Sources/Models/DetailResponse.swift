//
// Created by Mengyu Li on 2022/5/30.
//

import Foundation

public struct DetailResponse: Codable {
    public let wallpaper: WallpaperDetail

    enum CodingKeys: String, CodingKey {
        case wallpaper = "data"
    }
}
