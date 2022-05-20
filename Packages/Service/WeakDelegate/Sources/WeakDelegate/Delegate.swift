//
// Created by Mengyu Li on 2022/3/10.
//

public class Delegate<Input, Output> {
    private var block: ((Input) -> Output?)?

    public init() {}
}

// MARK: - Delegate On

public extension Delegate {
    func delegate<T: AnyObject>(on target: T, block: ((T, Input) -> Output)?) {
        self.block = { [weak target] input in
            guard let target = target else { return nil }
            return block?(target, input)
        }
    }
}

public extension Delegate {
    func call(_ input: Input) -> Output? { block?(input) }

    func callAsFunction(_ input: Input) -> Output? { call(input) }
}

public extension Delegate where Input == Void {
    func call() -> Output? { call(()) }

    func callAsFunction() -> Output? { call() }
}

public extension Delegate where Input == Void, Output: OptionalProtocol {
    func call() -> Output { call(()) }

    func callAsFunction() -> Output { call() }
}

public extension Delegate where Output: OptionalProtocol {
    func call(_ input: Input) -> Output {
        switch block?(input) {
        case .none:
            return Output._createNil
        case let .some(output):
            return output
        }
    }

    func callAsFunction(_ input: Input) -> Output { call(input) }
}

public protocol OptionalProtocol {
    static var _createNil: Self { get }
}

extension Optional: OptionalProtocol {
    public static var _createNil: Wrapped? { nil }
}
