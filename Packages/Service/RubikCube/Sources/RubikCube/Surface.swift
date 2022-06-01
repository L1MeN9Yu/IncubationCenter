//
// Created by Mengyu Li on 2022/6/1.
//

//		+---+---+---+
//		| a | b | c |
//		+---+---+---+
//		| d | e | f |
//		+---+---+---+
//		| g | h | i |
//		+---+---+---+
public struct Surface {
    public let (a, b, c): (Tile, Tile, Tile)
    public let (d, e, f): (Tile, Tile, Tile)
    public let (g, h, i): (Tile, Tile, Tile)

    init(a: Tile, b: Tile, c: Tile, d: Tile, e: Tile, f: Tile, g: Tile, h: Tile, i: Tile) {
        (self.a, self.b, self.c) = (a, b, c)
        (self.d, self.e, self.f) = (d, e, f)
        (self.g, self.h, self.i) = (g, h, i)
    }

    init(face: Face) {
        switch face {
        case .front: (a, b, c, d, e, f, g, h, i) = (.F01, .F02, .F03, .F04, .F05, .F06, .F07, .F08, .F09)
        case .back: (a, b, c, d, e, f, g, h, i) = (.B20, .B19, .B18, .B23, .B22, .B21, .B26, .B25, .B24)
        case .up: (a, b, c, d, e, f, g, h, i) = (.U18, .U19, .U20, .U10, .U11, .U12, .U01, .U02, .U03)
        case .down: (a, b, c, d, e, f, g, h, i) = (.D07, .D08, .D09, .D15, .D16, .D17, .D24, .D25, .D26)
        case .left: (a, b, c, d, e, f, g, h, i) = (.L18, .L10, .L01, .L21, .L13, .L04, .L24, .L15, .L07)
        case .right: (a, b, c, d, e, f, g, h, i) = (.R03, .R12, .R20, .R06, .R14, .R23, .R09, .R17, .R26)
        }
    }
}

extension Surface: CustomStringConvertible {
    public var description: String {
        [[a, b, c], [d, e, f], [g, h, i]].map { $0.map { String(describing: $0) }.joined(separator: "|") }.joined(separator: "\n")
    }
}

extension Surface: Equatable {
    public static func == (lhs: Surface, rhs: Surface) -> Bool {
        lhs.a == rhs.a && lhs.b == rhs.b && lhs.c == rhs.c && lhs.d == rhs.d && lhs.e == rhs.e && lhs.f == rhs.f && lhs.g == rhs.g && lhs.h == rhs.h && lhs.i == rhs.i
    }
}

extension Surface {
    var abc: (Tile, Tile, Tile) { (a, b, c) }
    var cba: (Tile, Tile, Tile) { (c, b, a) }
    var ghi: (Tile, Tile, Tile) { (g, h, i) }
    var ihg: (Tile, Tile, Tile) { (i, h, g) }
    var adg: (Tile, Tile, Tile) { (a, d, g) }
    var gda: (Tile, Tile, Tile) { (g, d, a) }
    var cfi: (Tile, Tile, Tile) { (c, f, i) }
    var ifc: (Tile, Tile, Tile) { (i, f, c) }
}

extension Surface {
    func turn(_ turn: Turn) -> Surface {
        switch turn {
        case .clockwise: return Surface(a: g, b: d, c: a, d: h, e: e, f: b, g: i, h: f, i: c)
        case .counterclockwise: return Surface(a: c, b: f, c: i, d: b, e: e, f: h, g: a, h: d, i: g)
        case .double: return Surface(a: i, b: h, c: g, d: f, e: e, f: d, g: c, h: b, i: a)
        }
    }

    func replaced(abc: (a: Tile, b: Tile, c: Tile)) -> Surface {
        Surface(a: abc.a, b: abc.b, c: abc.c, d: d, e: e, f: f, g: g, h: h, i: i)
    }

    func replaced(ghi: (g: Tile, h: Tile, i: Tile)) -> Surface {
        Surface(a: a, b: b, c: c, d: d, e: e, f: f, g: ghi.g, h: ghi.h, i: ghi.i)
    }

    func replaced(adg: (a: Tile, d: Tile, g: Tile)) -> Surface {
        Surface(a: adg.a, b: b, c: c, d: adg.d, e: e, f: f, g: adg.g, h: h, i: i)
    }

    func replaced(cfi: (c: Tile, f: Tile, i: Tile)) -> Surface {
        Surface(a: a, b: b, c: cfi.c, d: d, e: e, f: cfi.f, g: g, h: h, i: cfi.i)
    }
}
