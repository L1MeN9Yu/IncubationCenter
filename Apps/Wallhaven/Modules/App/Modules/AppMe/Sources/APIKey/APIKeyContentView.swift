//
// Created by Mengyu Li on 2022/6/16.
//

import Foundation
import UICore
import UIKit

class APIKeyContentView: View {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension APIKeyContentView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension APIKeyContentView {
    func setup() {}

    func layout() {}
}
