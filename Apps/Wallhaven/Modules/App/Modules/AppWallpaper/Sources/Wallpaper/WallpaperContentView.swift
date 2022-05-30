//
// Created by Mengyu Li on 2022/5/29.
//

import UICore
import UIKit

class WallpaperContentView: View {
    private lazy var wallpaperView = WallpaperView(frame: .zero)

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

        layout()
    }
}

private extension WallpaperContentView {
    func setup() {
        backgroundColor = .black
        wallpaperView.x.add(to: self)
    }

    func layout() {
        wallpaperView.pin.all()
    }
}

extension WallpaperContentView {
    func reloadData(viewModel: WallpaperViewModel) {
        wallpaperView.reloadData(url: viewModel.imageURL)
    }
}
