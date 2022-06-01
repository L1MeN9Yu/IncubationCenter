//
// Created by Mengyu Li on 2022/6/1.
//

public enum Turn {
    case clockwise
    case counterclockwise
    case double
}

public extension Turn {
    func reversed() -> Turn {
        switch self {
        case .clockwise: return .counterclockwise
        case .counterclockwise: return .clockwise
        case .double: return .double
        }
    }
}
