//
// Created by Mengyu Li on 2021/3/16.
//

public struct AnyObservable {
    public private(set) weak var observable: Observable?

    public init(observable: Observable) { self.observable = observable }
}

public extension AnyObservable {
    var isRemovable: Bool { observable == nil }
}
