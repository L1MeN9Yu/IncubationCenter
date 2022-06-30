//
// Created by Mengyu Li on 2022/6/30.
//

import BaseUI
import Foundation
import UIExtensionsKit
import UIKit

class DiskUsageContentView: View {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension DiskUsageContentView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension DiskUsageContentView {
    func setup() {
        backgroundColor = .systemWhite
    }

    func layout() {}
}
