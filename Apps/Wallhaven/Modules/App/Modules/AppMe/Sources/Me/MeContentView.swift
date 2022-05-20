//
// Created by Mengyu Li on 2022/5/20.
//

import UICore

class MeContentView: View {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension MeContentView {
    func setup() {
        backgroundColor = .systemWhite
    }
}
