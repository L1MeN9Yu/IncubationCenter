//
// Created by Mengyu Li on 2022/1/18.
//

public extension String {
    init(safe unsafeCString: UnsafePointer<CChar>, fallback: String = "") {
        guard let value = String(validatingUTF8: unsafeCString) else {
            self = fallback
            return
        }
        self = value
    }
}
