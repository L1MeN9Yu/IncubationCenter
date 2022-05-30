//
// Created by Mengyu Li on 2022/5/30.
//

public struct Tag: Codable {
    // "id": 1,
    public let id: Int
    // "name": "anime",
    public let name: String
    // "alias": "Chinese cartoons",
    public let alias: String
    // "category_id": 1,
    public let categoryID: UInt
    // "category": "Anime & Manga",
    public let category: String
    // "purity": "sfw",
    public let purity: String
    // "created_at": "2015-01-16 02:06:45"
    public let createdTime: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case alias
        case categoryID = "category_id"
        case category
        case purity
        case createdTime = "created_at"
    }
}
