//
// Created by Mengyu Li on 2020/6/10.
// Copyright (c) 2020 Mengyu Li. All rights reserved.
//

public protocol TypeNameable {
    static var typeName: String { get }

    var typeName: String { get }
}

public extension TypeNameable {
    static var typeName: String { String(describing: self) }
    var typeName: String { String(describing: self) }
}
