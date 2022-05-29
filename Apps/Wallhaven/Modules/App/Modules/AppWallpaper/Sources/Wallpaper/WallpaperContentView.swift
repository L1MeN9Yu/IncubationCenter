//
// Created by Mengyu Li on 2022/5/29.
//

import UICore

class WallpaperContentView: View {
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension WallpaperContentView {
    override open func layoutSubviews() {
        super.layoutSubviews()
    }
}

private extension WallpaperContentView {
    func setup() {
        backgroundColor = .black
    }
}
