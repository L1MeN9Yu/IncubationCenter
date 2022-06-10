//
// Created by Mengyu Li on 2022/6/9.
//

import Foundation
import UICore
import UIKit

class MeCollectionFooterView: CollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension MeCollectionFooterView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension MeCollectionFooterView {
    func setup() {
        backgroundColor = .systemGray6
    }

    func layout() {}
}

extension MeCollectionFooterView {
    func config(section: MeSection) {}
}
