//
// Created by Mengyu Li on 2022/6/20.
//

public struct SettingsResponse: Codable {
    public let settings: Settings

    enum CodingKeys: String, CodingKey {
        case settings = "data"
    }
}
