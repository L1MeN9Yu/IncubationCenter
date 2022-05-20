//
// Created by Mengyu Li on 2022/5/20.
//

import UICore
import UIKit

class DiscoveryContentView: View {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DiscoveryContentView {
    func setup() {
        backgroundColor = .systemWhite
    }
}
