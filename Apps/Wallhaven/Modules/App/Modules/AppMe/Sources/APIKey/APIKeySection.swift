//
// Created by Mengyu Li on 2022/6/17.
//

enum APIKeySection: CaseIterable {
    case input
    case about
}

extension APIKeySection {
    init?(section: Int) {
        switch section {
        case 0: self = .input
        case 1: self = .about
        default: return nil
        }
    }
}
