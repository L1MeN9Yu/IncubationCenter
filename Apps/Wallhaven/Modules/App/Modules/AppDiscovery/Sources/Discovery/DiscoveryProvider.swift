//
// Created by Mengyu Li on 2022/5/23.
//

import Center
import Foundation
import UICore

class DiscoveryProvider: Provider {}

extension DiscoveryProvider {
    func loadList(page: UInt) async throws -> ListResponse {
        let listResponse: ListResponse = try await APICenter.loadList(page: page)
        return listResponse
    }
}
