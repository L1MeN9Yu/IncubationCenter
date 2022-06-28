//
// Created by Mengyu Li on 2022/6/28.
//

public enum Purity {
    case sfw
    case sketchy
    case nsfw
}

extension Purity: CaseIterable {}

public extension Purity {
    static let title: String = Module.localizedString(key: "Purity.Title")
    var title: String {
        switch self {
        case .sfw:
            return Module.localizedString(key: "Purity.SFW.Title")
        case .sketchy:
            return Module.localizedString(key: "Purity.Sketchy.Title")
        case .nsfw:
            return Module.localizedString(key: "Purity.NSFW.Title")
        }
    }
}

public extension Purity {
    static let isMulti: Bool = true
}
