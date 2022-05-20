//
// Created by Mengyu Li on 2022/2/21.
//

@propertyWrapper
public struct Weak<T: AnyObject> {
    public weak var wrappedValue: T?

    public init(wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
}
