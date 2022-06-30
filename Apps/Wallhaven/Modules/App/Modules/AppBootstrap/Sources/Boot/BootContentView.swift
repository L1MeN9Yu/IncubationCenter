//
// Created by Mengyu Li on 2022/6/29.
//

import BaseUI
import Foundation
import UIExtensionsKit
import UIKit

class BootContentView: View {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension BootContentView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension BootContentView {
    func setup() {
        backgroundColor = .systemWhite
    }

    func layout() {}
}
