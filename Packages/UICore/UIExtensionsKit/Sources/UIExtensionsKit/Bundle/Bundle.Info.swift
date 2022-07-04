//
// Created by Mengyu Li on 2022/7/4.
//

import Foundation

public extension Bundle {
    var displayName: Optional<String> {
        infoDictionary?["CFBundleDisplayName"] as? String
    }
}
