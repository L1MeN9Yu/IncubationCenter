//
// Created by Mengyu Li on 2022/5/22.
//

import Foundation

class ListRequest: BaseRequestable {
    let path: String = "/api/v1/search"

    let queryItems: [URLQueryItem]?

    init(page: UInt, categories: [Categories], purity: [Purity], sorting: Sorting, order: Order) {
        let categoriesValue = Categories.allCases.sorted()
            .map {
                switch categories.contains($0) {
                case true: return "1"
                case false: return "0"
                }
            }
            .reduce(into: "") {
                $0 = $0 + $1
            }

        let purityValue = Purity.allCases.sorted()
            .map {
                switch purity.contains($0) {
                case true: return "1"
                case false: return "0"
                }
            }
            .reduce(into: "") {
                $0 = $0 + $1
            }

        queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "categories", value: categoriesValue),
            URLQueryItem(name: "purity", value: purityValue),
            URLQueryItem(name: "sorting", value: sorting.queryValue),
            URLQueryItem(name: "order", value: order.queryValue),
        ]
    }
}
