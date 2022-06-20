//
// Created by Mengyu Li on 2022/6/17.
//

enum APIKeyItem {
    case input(APIKeyInputViewModel)
    case about(APIKeyAboutViewModel)
}

extension APIKeyItem: Hashable {}
