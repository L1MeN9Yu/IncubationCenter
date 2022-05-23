//
// Created by Mengyu Li on 2022/5/23.
//

public struct ListResponse: Codable {
    public let wallpapers: [Wallpaper]
    public let meta: Meta

    enum CodingKeys: String, CodingKey {
        case wallpapers = "data"
        case meta
    }
}
