//
// Created by Mengyu Li on 2022/5/23.
//

public struct Wallpaper: Codable {
    // "id": "57v377",
    public let id: String
    // "url": "https://wallhaven.cc/w/57v377",
    public let url: String
    // "short_url": "https://whvn.cc/57v377",
    public let shortURL: String
    // "views": 13,
    public let viewCount: UInt
    // "favorites": 0,
    public let favorites: UInt
    // "source": "",
    public let source: String
    // "purity": "sfw",
    public let purity: String
    // "category": "anime",
    public let category: String
    // "dimension_x": 1920,
    public let dimensionX: UInt
    // "dimension_y": 1080,
    public let dimensionY: UInt
    // "resolution": "1920x1080",
    public let resolution: String
    // "ratio": "1.78",
    public let ratio: String
    // "file_size": 2966535,
    public let fileSize: UInt64
    // "file_type": "image/png",
    public let fileType: String
    // "created_at": "2022-05-23 00:56:59",
    public let createdAt: String
    // "colors": [
    // "#999999",
    // "#424153",
    // "#663399",
    // "#abbcda",
    // "#000000"
    // ],
    public let colors: [String]
    // "path": "https://w.wallhaven.cc/full/57/wallhaven-57v377.png",
    public let path: String
    // "thumbs": {
    // "large": "https://th.wallhaven.cc/lg/57/57v377.jpg",
    // "original": "https://th.wallhaven.cc/orig/57/57v377.jpg",
    // "small": "https://th.wallhaven.cc/small/57/57v377.jpg"
    // }
    public let thumbnail: Thumbnail

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case shortURL = "short_url"
        case viewCount = "views"
        case favorites
        case source
        case purity
        case category
        case dimensionX = "dimension_x"
        case dimensionY = "dimension_y"
        case resolution
        case ratio
        case fileSize = "file_size"
        case fileType = "file_type"
        case createdAt = "created_at"
        case colors
        case path
        case thumbnail = "thumbs"
    }
}
