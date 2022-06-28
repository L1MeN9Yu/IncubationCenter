//
// Created by Mengyu Li on 2022/6/28.
//

public enum Sorting {
    case dateAdded
    case relevance
    case random
    case views
    case favorites
    case topList
}

public extension Sorting {
    static let title: String = Module.localizedString(key: "Sorting.Title")
    var title: String {
        switch self {
        case .dateAdded:
            return Module.localizedString(key: "Sorting.DateAdded.Title")
        case .relevance:
            return Module.localizedString(key: "Sorting.Relevance.Title")
        case .random:
            return Module.localizedString(key: "Sorting.Random.Title")
        case .views:
            return Module.localizedString(key: "Sorting.Views.Title")
        case .favorites:
            return Module.localizedString(key: "Sorting.Favorites.Title")
        case .topList:
            return Module.localizedString(key: "Sorting.TopList.Title")
        }
    }
}
