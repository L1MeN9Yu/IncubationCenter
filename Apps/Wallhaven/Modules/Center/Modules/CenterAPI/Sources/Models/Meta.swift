//
// Created by Mengyu Li on 2022/5/23.
//

public struct Meta: Codable {
    // "current_page": 1,
    public let currentPage: UInt
    // "last_page": 16348,
    public let lastPage: UInt
    // "per_page": 24,
    public let pageSize: UInt
    // "total": 392341,
    public let total: UInt
    // "query": null,
    public let query: String?
    // "seed": null
    public let seed: String?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case lastPage = "last_page"
        case pageSize = "per_page"
        case total
        case query
        case seed
    }
}