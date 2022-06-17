//
// Created by Mengyu Li on 2022/6/17.
//

import Foundation
import UICombine
import UICore
import UIKit
import UIResource
import WeakDelegate

class APIKeyInputCollectionViewCell: CollectionViewCell {
    private lazy var subscriptions = Set<AnyCancellable>()

    private lazy var textField = UITextField(frame: .zero)
        .x
        .backgroundColor(.systemGray6)
        .borderStyle(.roundedRect)
        .instance

    private lazy var resetButton = UIButton(type: .custom)
        .x
        .setTitle(MeModule.localizedString(key: "APIKeyViewController.Input.ResetButton.Title"), for: .normal)
        .setTitleColor(.systemWhite, for: .normal)
        .setBackgroundImage(UIImage(color: .systemBlack), for: .normal)
        .corners(radius: 8)
        .instance

    private lazy var setButton = UIButton(type: .custom)
        .x
        .setTitle(MeModule.localizedString(key: "APIKeyViewController.Input.SetButton.Title"), for: .normal)
        .setTitleColor(.systemWhite, for: .normal)
        .setBackgroundImage(UIImage(color: .systemBlack), for: .normal)
        .corners(radius: 8)
        .instance

    private(set) lazy var resetButtonDelegator = Delegator<Void, Void>()
    private(set) lazy var setButtonDelegator = Delegator<Void, Void>()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension APIKeyInputCollectionViewCell {
    override open func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
}

private extension APIKeyInputCollectionViewCell {
    func setup() {
        textField.x.add(to: contentView)
        resetButton.x.add(to: contentView)
        setButton.x.add(to: contentView)

        resetButton.tapPublisher.receive(on: DispatchQueue.main).sink { [weak self] in
            guard let self = self else { return }
            self.resetButtonDelegator()
        }
        .store(in: &subscriptions)
        setButton.tapPublisher.receive(on: DispatchQueue.main).sink { [weak self] in
            guard let self = self else { return }
            self.setButtonDelegator()
        }
        .store(in: &subscriptions)
    }

    func layout() {
        textField.pin.left(16).top(16).right(16).height(32)
        resetButton.pin.bottom(16).left(32).height(30%).aspectRatio(2.5)
        setButton.pin.bottom(16).right(32).height(30%).aspectRatio(2.5)
    }
}

extension APIKeyInputCollectionViewCell {
    @discardableResult
    func config(viewModel: APIKeyInputViewModel) -> Self {
        textField.x.text(viewModel.apiKey).done
        return self
    }
}
