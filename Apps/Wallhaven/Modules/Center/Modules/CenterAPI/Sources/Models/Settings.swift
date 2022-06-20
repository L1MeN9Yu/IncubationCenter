//
// Created by Mengyu Li on 2022/6/20.
//

public struct Settings: Codable {
    // "thumb_size": "orig",
    public let thumbnailSize: String
    // "per_page": "24",
    public let pageSize: String
    // "purity": [
    // "sfw",
    // "sketchy",
    // "nsfw"
    // ],
    public let purity: [String]
    // "categories": [
    // "general",
    // "anime",
    // "people"
    // ],
    public let categories: [String]
    // "resolutions": [
    // "1920x1080",
    // "2560x1440"
    // ],
    public let resolutions: [String]
    // "aspect_ratios": [
    // "16x9"
    // ],
    public let aspectRatios: [String]
    // "toplist_range": "6M",
    public let topListRange: String
    // "tag_blacklist": [
    // "blacklist tag",
    // "another"
    // ],
    public let tagBlacklist: [String]
    // "user_blacklist": [
    // ""
    // ]
    public let userBlacklist: [String]

    enum CodingKeys: String, CodingKey {
        case thumbnailSize = "thumb_size"
        case pageSize = "per_page"
        case purity
        case categories
        case resolutions
        case aspectRatios = "aspect_ratios"
        case topListRange = "toplist_range"
        case tagBlacklist = "tag_blacklist"
        case userBlacklist = "user_blacklist"
    }
}
