//
// Created by Mengyu Li on 2022/6/30.
//

import UIBase
import Foundation
import UIExtensionsKit
import UIKit

class DiagnoseContentView: View {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension DiagnoseContentView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension DiagnoseContentView {
    func setup() {
        backgroundColor = .systemWhite
    }

    func layout() {}
}
