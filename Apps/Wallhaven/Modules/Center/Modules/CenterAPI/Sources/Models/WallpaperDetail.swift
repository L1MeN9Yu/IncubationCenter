//
// Created by Mengyu Li on 2022/5/30.
//

public struct WallpaperDetail: Codable {
    // "id": "94x38z",
    public let id: String
    // "url": "https://wallhaven.cc/w/94x38z",
    public let url: String
    // "short_url": "http://whvn.cc/94x38z",
    public let shortURL: String
    // uploader
    public let uploader: Uploader
    // "views": 12,
    public let viewCount: UInt
    // "favorites": 0,
    public let favoriteCount: UInt
    // "source": "",
    public let source: String
    // "purity": "sfw",
    public let purity: String
    // "category": "anime",
    public let category: String
    // "dimension_x": 6742,
    public let dimensionX: UInt
    // "dimension_y": 3534,
    public let dimensionY: UInt
    // "resolution": "6742x3534",
    public let resolution: String
    // "ratio": "1.91",
    public let ratio: String
    // "file_size": 5070446,
    public let fileSize: UInt
    // "file_type": "image/jpeg",
    public let fileType: String
    // "created_at": "2018-10-31 01:23:10",
    public let createTime: String
    // colors
    public let colors: [String]
    // "path": "https://w.wallhaven.cc/full/94/wallhaven-94x38z.jpg",
    public let path: String
    // thumbs
    public let thumbnail: Thumbnail
    // tags
    public let tags: [Tag]

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case shortURL = "short_url"
        case uploader
        case viewCount = "views"
        case favoriteCount = "favorites"
        case source
        case purity
        case category
        case dimensionX = "dimension_x"
        case dimensionY = "dimension_y"
        case resolution
        case ratio
        case fileSize = "file_size"
        case fileType = "file_type"
        case createTime = "created_at"
        case colors
        case path
        case thumbnail = "thumbs"
        case tags
    }
}
