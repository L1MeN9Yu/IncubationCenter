//
// Created by Mengyu Li on 2021/3/22.
//

public extension Bool {
    func map<T>(true: T, false: T) -> T {
        switch self {
        case true:
            return `true`
        case false:
            return `false`
        }
    }

    func map<T>(true: () -> T, false: () -> T) -> T {
        switch self {
        case true:
            return `true`()
        case false:
            return `false`()
        }
    }
}
