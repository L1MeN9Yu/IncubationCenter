//
// Created by Mengyu Li on 2022/6/28.
//

import Coder
import DataConvert
import Foundation

public struct Filter {
    public let categories: [Categories]
    public let purity: [Purity]
    public let sorting: Sorting
    public let order: Order

    public init(categories: [Categories], purity: [Purity], sorting: Sorting, order: Order) {
        self.categories = categories
        self.purity = purity
        self.sorting = sorting
        self.order = order
    }
}

extension Filter: Codable {}

extension Filter {
    static let `default` = Filter(categories: Categories.allCases, purity: Purity.allCases, sorting: .dateAdded, order: .descending)
}

extension Filter: DataConvertible {
    public func toData() throws -> Data {
        try JSONCoder.encode(object: self)
    }

    public init(data: Data) throws {
        self = try JSONCoder.decode(data: data)
    }
}
