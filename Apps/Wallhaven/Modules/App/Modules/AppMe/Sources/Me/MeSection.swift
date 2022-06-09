//
// Created by Mengyu Li on 2022/6/2.
//

enum MeSection: CaseIterable {
    case wallhaven
    case app
    case usage
    case about
}

extension MeSection {
    var localizedTitle: String {
        switch self {
        case .wallhaven: return MeModule.localizedString(key: "MeViewController.Section.Wallhaven")
        case .app: return MeModule.localizedString(key: "MeViewController.Section.App")
        case .usage: return MeModule.localizedString(key: "MeViewController.Section.Usage")
        case .about: return MeModule.localizedString(key: "MeViewController.Section.About")
        }
    }
}
