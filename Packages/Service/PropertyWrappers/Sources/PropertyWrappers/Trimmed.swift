//
// Created by Mengyu Li on 2021/2/10.
//

import Foundation

@propertyWrapper
public struct Trimmed {
    private var value: String = ""

    public init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }

    public var wrappedValue: String {
        get { value }
        set { value = newValue.trimmingCharacters(in: .whitespacesAndNewlines) }
    }
}
