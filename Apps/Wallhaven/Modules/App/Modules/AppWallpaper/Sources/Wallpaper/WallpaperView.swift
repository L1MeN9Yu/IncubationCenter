//
// Created by Mengyu Li on 2022/5/30.
//

import Foundation
import UICore
import UIKit

class WallpaperView: View {
    private lazy var scrollView = UIScrollView(frame: .zero)
        .x
        .delegate(self)
        .zoomScale(1.0)
        .minimumZoomScale(1.0)
        .maximumZoomScale(2.0)
        .contentInsetAdjustmentBehavior(.never)
        .instance
    private lazy var imageView = UIImageView(frame: .zero)
        .x
        .contentMode(.scaleAspectFit)
        .instance

    override init(frame: CoreGraphics.CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension WallpaperView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension WallpaperView {
    func setup() {
        scrollView.x.add(to: self)
        imageView.x.add(to: scrollView)
    }

    func layout() {
        scrollView.pin.all()
        imageView.pin.all()
    }
}

extension WallpaperView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}

extension WallpaperView {
    func reloadData(url: URL?) {
        imageView.kf.setImage(with: url)
    }
}
