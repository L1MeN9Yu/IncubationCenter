//
// Created by Mengyu Li on 2022/6/17.
//

import Foundation
import UICore
import UIKit

class APIKeyCollectionFooterView: CollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension APIKeyCollectionFooterView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension APIKeyCollectionFooterView {
    func setup() {
        backgroundColor = .systemGray6
    }

    func layout() {}
}

extension APIKeyCollectionFooterView {
    func config(section: APIKeySection) {}
}
