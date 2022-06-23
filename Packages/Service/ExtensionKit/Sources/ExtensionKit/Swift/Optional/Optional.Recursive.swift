//
// Created by Mengyu Li on 2022/6/23.
//

public extension Optional {
    func flatten() -> Wrapped? {
        self
    }

    func flatten<T>() -> T? where Wrapped == T? {
        map { $0.flatten() } ?? nil
    }

    func flatten<T>() -> T? where Wrapped == T?? {
        map { $0.flatten() } ?? nil
    }

    func flatten<T>() -> T? where Wrapped == T??? {
        map { $0.flatten() } ?? nil
    }

    func flatten<T>() -> T? where Wrapped == T???? {
        map { $0.flatten() } ?? nil
    }

    func flatten<T>() -> T? where Wrapped == T????? {
        map { $0.flatten() } ?? nil
    }
}
