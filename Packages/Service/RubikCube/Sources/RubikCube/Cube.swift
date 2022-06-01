//
// Created by Mengyu Li on 2022/6/1.
//

public struct Cube {
    public let front: Surface
    public let back: Surface
    public let up: Surface
    public let down: Surface
    public let left: Surface
    public let right: Surface

    public init(front: Surface, back: Surface, up: Surface, down: Surface, left: Surface, right: Surface) {
        self.front = front
        self.back = back
        self.up = up
        self.down = down
        self.left = left
        self.right = right
    }

    public init() {
        front = Surface(face: .front)
        back = Surface(face: .back)
        up = Surface(face: .up)
        down = Surface(face: .down)
        left = Surface(face: .left)
        right = Surface(face: .right)
    }
}

extension Cube: CustomStringConvertible {
    public var description: String {
        let (f, b, u, d, l, r) = (front, back, up, down, left, right)
        return ([
            [nil, nil, nil, u.a, u.b, u.c, nil, nil, nil, nil, nil, nil],
            [nil, nil, nil, u.d, u.e, u.f, nil, nil, nil, nil, nil, nil],
            [nil, nil, nil, u.g, u.h, u.i, nil, nil, nil, nil, nil, nil],
            [l.a, l.b, l.c, f.a, f.b, f.c, r.a, r.b, r.c, b.a, b.b, b.c],
            [l.d, l.e, l.f, f.d, f.e, f.f, r.d, r.e, r.f, b.d, b.e, b.f],
            [l.g, l.h, l.i, f.g, f.h, f.i, r.g, r.h, r.i, b.g, b.h, b.i],
            [nil, nil, nil, d.a, d.b, d.c, nil, nil, nil, nil, nil, nil],
            [nil, nil, nil, d.d, d.e, d.f, nil, nil, nil, nil, nil, nil],
            [nil, nil, nil, d.g, d.h, d.i, nil, nil, nil, nil, nil, nil],
        ] as [[Tile?]])
            .map { "|" + $0.map { $0 != nil ? String(describing: $0!) + "|" : "   |" }.joined() }.joined(separator: "\n")
    }
}

public extension Cube {
    func surface(face: Face) -> Surface {
        switch face {
        case .front: return front
        case .back: return back
        case .up: return up
        case .down: return down
        case .left: return left
        case .right: return right
        }
    }
}

public extension Cube {
    func makeFront(_ turn: Turn) -> Cube {
        let f = front.turn(turn)
        switch turn {
        case .clockwise:
            let u = up.replaced(ghi: left.ifc)
            let r = right.replaced(adg: up.ghi)
            let d = down.replaced(abc: right.gda)
            let l = left.replaced(cfi: down.abc)
            return Cube(front: f, back: back, up: u, down: d, left: l, right: r)
        case .counterclockwise:
            let u = up.replaced(ghi: right.adg)
            let r = right.replaced(adg: down.cba)
            let d = down.replaced(abc: left.cfi)
            let l = left.replaced(cfi: up.ihg)
            return Cube(front: f, back: back, up: u, down: d, left: l, right: r)
        case .double:
            let u = up.replaced(ghi: down.cba)
            let r = right.replaced(adg: left.ifc)
            let d = down.replaced(abc: up.ihg)
            let l = left.replaced(cfi: right.gda)
            return Cube(front: f, back: back, up: u, down: d, left: l, right: r)
        }
    }

    func makeBack(_ turn: Turn) -> Cube {
        let b = back.turn(turn)
        switch turn {
        case .clockwise:
            let u = up.replaced(abc: right.cfi)
            let r = right.replaced(cfi: down.ihg)
            let d = down.replaced(ghi: left.adg)
            let l = left.replaced(adg: up.cba)
            return Cube(front: front, back: b, up: u, down: d, left: l, right: r)
        case .counterclockwise:
            let u = up.replaced(abc: left.gda)
            let r = right.replaced(cfi: up.abc)
            let d = down.replaced(ghi: right.ifc)
            let l = left.replaced(adg: down.ghi)
            return Cube(front: front, back: b, up: u, down: d, left: l, right: r)
        case .double:
            let u = up.replaced(abc: down.ihg)
            let r = right.replaced(cfi: left.gda)
            let d = down.replaced(ghi: up.cba)
            let l = left.replaced(adg: right.ifc)
            return Cube(front: front, back: b, up: u, down: d, left: l, right: r)
        }
    }

    func makeUp(_ turn: Turn) -> Cube {
        let u = up.turn(turn)
        switch turn {
        case .clockwise:
            let f = front.replaced(abc: right.abc)
            let l = left.replaced(abc: front.abc)
            let b = back.replaced(abc: left.abc)
            let r = right.replaced(abc: back.abc)
            return Cube(front: f, back: b, up: u, down: down, left: l, right: r)
        case .counterclockwise:
            let f = front.replaced(abc: left.abc)
            let l = left.replaced(abc: back.abc)
            let b = back.replaced(abc: right.abc)
            let r = right.replaced(abc: front.abc)
            return Cube(front: f, back: b, up: u, down: down, left: l, right: r)
        case .double:
            let f = front.replaced(abc: back.abc)
            let l = left.replaced(abc: right.abc)
            let b = back.replaced(abc: front.abc)
            let r = right.replaced(abc: left.abc)
            return Cube(front: f, back: b, up: u, down: down, left: l, right: r)
        }
    }

    func makeDown(_ turn: Turn) -> Cube {
        let d = down.turn(turn)
        switch turn {
        case .clockwise:
            let f = front.replaced(ghi: left.ghi)
            let l = left.replaced(ghi: back.ghi)
            let b = back.replaced(ghi: right.ghi)
            let r = right.replaced(ghi: front.ghi)
            return Cube(front: f, back: b, up: up, down: d, left: l, right: r)
        case .counterclockwise:
            let f = front.replaced(ghi: right.ghi)
            let l = left.replaced(ghi: front.ghi)
            let b = back.replaced(ghi: left.ghi)
            let r = right.replaced(ghi: back.ghi)
            return Cube(front: f, back: b, up: up, down: d, left: l, right: r)
        case .double:
            let f = front.replaced(ghi: back.ghi)
            let l = left.replaced(ghi: right.ghi)
            let b = back.replaced(ghi: front.ghi)
            let r = right.replaced(ghi: left.ghi)
            return Cube(front: f, back: b, up: up, down: d, left: l, right: r)
        }
    }

    func makeRight(_ turn: Turn) -> Cube {
        let r = right.turn(turn)
        switch turn {
        case .clockwise:
            let f = front.replaced(cfi: down.cfi)
            let u = up.replaced(cfi: front.cfi)
            let b = back.replaced(adg: up.ifc)
            let d = down.replaced(cfi: back.gda)
            return Cube(front: f, back: b, up: u, down: d, left: left, right: r)
        case .counterclockwise:
            let f = front.replaced(cfi: up.cfi)
            let u = up.replaced(cfi: back.gda)
            let b = back.replaced(adg: down.ifc)
            let d = down.replaced(cfi: front.cfi)
            return Cube(front: f, back: b, up: u, down: d, left: left, right: r)
        case .double:
            let f = front.replaced(cfi: back.gda)
            let u = up.replaced(cfi: down.cfi)
            let b = back.replaced(adg: front.ifc)
            let d = down.replaced(cfi: up.cfi)
            return Cube(front: f, back: b, up: u, down: d, left: left, right: r)
        }
    }

    func makeLeft(_ turn: Turn) -> Cube {
        let l = left.turn(turn)
        switch turn {
        case .clockwise:
            let f = front.replaced(adg: up.adg)
            let u = up.replaced(adg: back.ifc)
            let b = back.replaced(cfi: down.gda)
            let d = down.replaced(adg: front.adg)
            return Cube(front: f, back: b, up: u, down: d, left: l, right: right)
        case .counterclockwise:
            let f = front.replaced(adg: down.adg)
            let u = up.replaced(adg: front.adg)
            let b = back.replaced(cfi: up.gda)
            let d = down.replaced(adg: back.ifc)
            return Cube(front: f, back: b, up: u, down: d, left: l, right: right)
        case .double:
            let f = front.replaced(adg: back.ifc)
            let u = up.replaced(adg: down.adg)
            let b = back.replaced(cfi: front.gda)
            let d = down.replaced(adg: up.adg)
            return Cube(front: f, back: b, up: u, down: d, left: l, right: right)
        }
    }

    func makeMove(_ movement: Movement) -> Cube {
        switch movement {
        case let .front(turn): return makeFront(turn)
        case let .back(turn): return makeBack(turn)
        case let .up(turn): return makeUp(turn)
        case let .down(turn): return makeDown(turn)
        case let .left(turn): return makeLeft(turn)
        case let .right(turn): return makeRight(turn)
        }
    }

    func reverseMove(_ movement: Movement) -> Cube {
        switch movement {
        case let .front(turn): return makeFront(turn.reversed())
        case let .back(turn): return makeBack(turn.reversed())
        case let .up(turn): return makeUp(turn.reversed())
        case let .down(turn): return makeDown(turn.reversed())
        case let .left(turn): return makeLeft(turn.reversed())
        case let .right(turn): return makeRight(turn.reversed())
        }
    }

    func makeMoves(_ movements: [Movement]) -> Cube {
        var cube = self
        for movement in movements {
            cube = cube.makeMove(movement)
        }
        return cube
    }

    func reverseMoves(_ movements: [Movement]) -> Cube {
        var cube = self
        for movement in movements.reversed() {
            cube = cube.reverseMove(movement)
        }
        return cube
    }
}

extension Cube: Equatable {
    public static func == (lhs: Cube, rhs: Cube) -> Bool {
        lhs.front == rhs.front && lhs.back == rhs.back && lhs.up == rhs.up && lhs.down == rhs.down && lhs.left == rhs.left && lhs.right == rhs.right
    }
}
