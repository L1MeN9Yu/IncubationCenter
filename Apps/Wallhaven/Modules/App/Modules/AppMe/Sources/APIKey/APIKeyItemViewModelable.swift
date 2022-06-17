//
// Created by Mengyu Li on 2022/6/17.
//

import Foundation
import UICore

protocol APIKeyItemViewModelable: Hashable where Self: ViewModel {
    var section: APIKeySection { get }
}

extension APIKeyItemViewModelable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(section)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.section == rhs.section
    }
}
