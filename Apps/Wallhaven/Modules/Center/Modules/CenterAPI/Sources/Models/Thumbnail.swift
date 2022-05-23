//
// Created by Mengyu Li on 2022/5/23.
//

public struct Thumbnail: Codable {
    // "large": "https://th.wallhaven.cc/lg/57/57v377.jpg",
    public let large: String
    // "original": "https://th.wallhaven.cc/orig/57/57v377.jpg",
    public let original: String
    // "small": "https://th.wallhaven.cc/small/57/57v377.jpg"
    public let small: String
}
