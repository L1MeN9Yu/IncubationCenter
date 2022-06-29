//
// Created by Mengyu Li on 2022/6/28.
//

public enum Categories {
    case general
    case anime
    case people
}

extension Categories: CaseIterable {}

extension Categories: Comparable {}

extension Categories: Codable {}

public extension Categories {
    static let title: String = Module.localizedString(key: "Categories.Title")

    var title: String {
        switch self {
        case .general:
            return Module.localizedString(key: "Categories.General.Title")
        case .anime:
            return Module.localizedString(key: "Categories.Anime.Title")
        case .people:
            return Module.localizedString(key: "Categories.People.Title")
        }
    }
}

public extension Categories {
    static let isMulti: Bool = true
}
