//
// Created by Mengyu Li on 2022/6/17.
//

import CenterAPI
import Foundation
import UICore

class APIKeyProvider: Provider {}

extension APIKeyProvider {
    func check(apikey: String) async throws -> Settings {
        let settingsResponse = try await APICenter.loadSettings(apikey: apikey)
        let settings = settingsResponse.settings
        return settings
    }
}
