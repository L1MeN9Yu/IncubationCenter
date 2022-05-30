//
// Created by Mengyu Li on 2022/5/29.
//

import Center
import UICore

class WallpaperProvider: Provider {}

extension WallpaperProvider {
    func loadDetail(id: String) async throws -> DetailResponse {
        let detailResponse: DetailResponse = try await APICenter.loadDetail(id: id)
        return detailResponse
    }
}
