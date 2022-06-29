//
// Created by Mengyu Li on 2022/6/27.
//

import CenterAPI
import Foundation
import UICore

class FilterProvider: Provider {}

extension FilterProvider {
    func loadFilter() async -> CenterAPI.Filter {
        APICenter.filter
    }

    func saveFilter(_ filter: CenterAPI.Filter) {
        APICenter.setFilter(filter)
    }
}
