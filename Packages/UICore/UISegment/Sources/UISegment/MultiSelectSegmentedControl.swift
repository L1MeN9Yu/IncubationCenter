//
// Created by Mengyu Li on 2022/6/27.
//

import UIKit

@IBDesignable
open class MultiSelectSegmentedControl: UIControl {
    public weak var delegate: MultiSelectSegmentedControlDelegate?

    /// Items shown in segments. Each item can be a `String`, a `UIImage`, or an array of strings and images.
    public var items: [Any] {
        get {
            segments
                .map(\.contents)
                .map { $0.count == 1 ? $0[0] : $0 }
        }
        set {
            removeAllSegments()
            for item in newValue {
                let arrayItem = item as? [Any] ?? [item]
                insertSegment(contents: arrayItem)
            }
        }
    }

    /// Indexes of selected segments (can be more than one if `allowsMultipleSelection` is `true`.
    public var selectedSegmentIndexes: IndexSet {
        get {
            IndexSet(segments.enumerated().filter { $1.isSelected }.map(\.offset))
        }
        set {
            for (i, segment) in segments.enumerated() {
                segment.isSelected = newValue.contains(i)
                showDividersBetweenSelectedSegments()
            }
        }
    }

    public var selectedSegmentTitles: [String] {
        segments.filter(\.isSelected).compactMap(\.title)
    }

    /// Allow use to select multiple segments (default: `true`).
    @IBInspectable open dynamic var allowsMultipleSelection: Bool = true {
        didSet {
            if !allowsMultipleSelection {
                selectedSegmentIndex = selectedSegmentIndex
            }
        }
    }

    /// Select or deselect all segments
    /// - Parameter selected: `true` to select (default), `false` to deselect.
    public func selectAllSegments(_ selected: Bool = true) {
        selectedSegmentIndexes = selected ? IndexSet(0..<segments.count) : []
    }

    /// Add segment to the control.
    /// - Parameter contents: An array of 1 or more strings and images
    /// - Parameter index: Where to insert the segment (default: at the end)
    /// - Parameter animated: Animate the insertion (default: false)
    open func insertSegment(contents: [Any], at index: Int = UISegmentedControl.noSegment, animated: Bool = false) {
        let segment = MultiSelectSegment(contents: contents, parent: self)
        segment.tintColor = tintColor
        segment.isHidden = true
        perform(animated: animated) { [stackView] in
            if index >= 0, index < stackView.arrangedSubviews.count {
                stackView.insertArrangedSubview(segment, at: index)
                self.removeDivider(at: index - 1)
                self.insertDivider(afterSegment: index - 1)
                self.insertDivider(afterSegment: index)
            } else {
                stackView.addArrangedSubview(segment)
                self.insertDivider(afterSegment: stackView.arrangedSubviews.count - 2)
            }
            segment.isHidden = false
            self.showDividersBetweenSelectedSegments()
            self.invalidateIntrinsicContentSize()
        }
    }

    // MARK: - Appearance

    /// Width of the dividers between segments and the border around the view.
    @IBInspectable open dynamic var borderWidth: CGFloat = 1 {
        didSet {
            stackView.spacing = borderWidth
            borderView.layer.borderWidth = borderWidth
            for divider in dividers {
                constrainDividerToControl(divider: divider)
            }
            constrain(stackView, at: .left, to: borderView, diff: borderWidth)
            constrain(stackView, at: .right, to: borderView, diff: -borderWidth)
            invalidateIntrinsicContentSize()
        }
    }

    /// Corner radius of the view.
    @IBInspectable open dynamic var borderRadius: CGFloat = 4 {
        didSet {
            layer.cornerRadius = borderRadius
            borderView.layer.cornerRadius = borderRadius
        }
    }

    /// Stack the segments vertically. (default: `false`)
    @IBInspectable open dynamic var isVertical: Bool {
        get { stackView.axis == .vertical }
        set {
            removeAllDividers()
            stackView.axis = newValue ? .vertical : .horizontal
            DispatchQueue.main.async { // wait for new layout to take effect, to prevent auto layout error
                self.addAllDividers()
            }
            invalidateIntrinsicContentSize()
        }
    }

    /// Stack each segment contents vertically when it contains both text and image. (default: `false`)
    @IBInspectable open dynamic var isVerticalSegmentContents: Bool = false {
        didSet {
            segments.forEach { $0.updateContentsAxis() }
            invalidateIntrinsicContentSize()
        }
    }

    public dynamic var titleTextAttributes: [UIControl.State: [NSAttributedString.Key: Any]] = [:] {
        didSet {
            segments.forEach { $0.updateTitleAttributes() }
            invalidateIntrinsicContentSize()
        }
    }

    /// Configure additional properties of segments titles. For example: `multiSegment.titleConfigurationHandler = { $0.numberOfLines = 0 }`
    open dynamic var titleConfigurationHandler: ((UILabel) -> Void)? {
        didSet {
            for segment in segments {
                segment.updateLabelConfiguration()
            }
            invalidateIntrinsicContentSize()
        }
    }

    /// Optional selected background color, if different than tintColor
    @IBInspectable open dynamic var selectedBackgroundColor: UIColor? {
        didSet {
            segments.forEach { $0.updateColors() }
        }
    }

    public convenience init(items: [Any]? = nil) {
        self.init(frame: .zero)
        if let items = items {
            self.items = items
        }
    }

    public var selectedSegmentIndex: Int {
        get {
            selectedSegmentIndexes.first ?? UISegmentedControl.noSegment
        }
        set {
            selectedSegmentIndexes = newValue >= 0 && newValue < segments.count ? [newValue] : []
        }
    }

    public var numberOfSegments: Int {
        segments.count
    }

    /// Use different size for each segment, depending on its content size. (default: `false`)
    @IBInspectable public dynamic var apportionsSegmentWidthsByContent: Bool {
        get { stackView.distribution != .fillEqually }
        set {
            stackView.distribution = newValue ? .fill : .fillEqually
            invalidateIntrinsicContentSize()
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    public var segments: [MultiSelectSegment] {
        stackView.arrangedSubviews.compactMap { $0 as? MultiSelectSegment }
    }

    let stackView = UIStackView()
    let borderView = UIView()
    var dividers: [UIView] = []
}

// MARK: - Public

public extension MultiSelectSegmentedControl {
    func setImage(_ image: UIImage?, forSegmentAt index: Int) {
        guard index >= 0, index < segments.count else { return }
        segments[index].image = image
        invalidateIntrinsicContentSize()
    }

    func imageForSegment(at index: Int) -> UIImage? {
        guard index >= 0, index < segments.count else { return nil }
        return segments[index].image
    }

    func setTitle(_ title: String?, forSegmentAt index: Int) {
        guard index >= 0, index < segments.count else { return }
        segments[index].title = title
        invalidateIntrinsicContentSize()
    }

    func titleForSegment(at index: Int) -> String? {
        guard index >= 0, index < segments.count else { return nil }
        return segments[index].title
    }

    func setTitleTextAttributes(_ attributes: [NSAttributedString.Key: Any]?, for state: UIControl.State) {
        titleTextAttributes[state] = attributes
        invalidateIntrinsicContentSize()
    }

    func titleTextAttributes(for state: UIControl.State) -> [NSAttributedString.Key: Any]? {
        titleTextAttributes[state]
    }

    func insertSegment(with image: UIImage, at index: Int = UISegmentedControl.noSegment, animated: Bool = false) {
        insertSegment(contents: [image], at: index, animated: animated)
    }

    func insertSegment(withTitle title: String, at index: Int = UISegmentedControl.noSegment, animated: Bool = false) {
        insertSegment(contents: [title], at: index, animated: animated)
    }

    func removeAllSegments() {
        removeAllDividers()
        stackView.removeAllArrangedSubviewsCompletely()
        invalidateIntrinsicContentSize()
    }

    func removeSegment(at index: Int, animated: Bool) {
        guard index >= 0, index < segments.count else { return }
        let segment = segments[index]
        perform(animated: animated) {
            segment.isHidden = true
            self.removeDivider(at: index) // after removed segment
            self.removeDivider(at: index - 1) // before removed segment
        }
        perform(animated: animated) {
            self.stackView.removeArrangedSubviewCompletely(segment)
            self.insertDivider(afterSegment: index - 1) // before removed segment
            self.showDividersBetweenSelectedSegments()
            self.invalidateIntrinsicContentSize()
        }
    }

    func setEnabled(_ enabled: Bool, forSegmentAt index: Int) {
        guard index >= 0, index < segments.count else { return }
        segments[index].isEnabled = enabled
    }

    func isEnabledForSegment(at index: Int) -> Bool {
        guard index >= 0, index < segments.count else { return false }
        return segments[index].isEnabled
    }
}

// MARK: - Override

extension MultiSelectSegmentedControl {
    override open var backgroundColor: UIColor? {
        didSet {
            segments.forEach { $0.updateColors() }
        }
    }

    override open func tintColorDidChange() {
        super.tintColorDidChange()
        let newTint = actualTintColor
        borderView.layer.borderColor = newTint.cgColor
        dividers.forEach { $0.backgroundColor = newTint }
        segments.forEach { $0.tintColor = tintColor }
    }

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        items = ["Lorem", "Ipsum", "Sit"]
    }

    override open var intrinsicContentSize: CGSize { // to pacify Interface Builder frame calculations
        let stackViewSize = stackView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return CGRect(origin: .zero, size: stackViewSize).insetBy(dx: -borderWidth, dy: -borderWidth).size
    }
}

// MARK: - Private

private extension MultiSelectSegmentedControl {
    // MARK: Setup

    private func setup() {
        addConstrainedSubview(borderView, constrain: .top, .bottom, .left, .right)
        addConstrainedSubview(stackView, constrain: .top, .bottom)
        constrain(stackView, at: .left, to: borderView, diff: 1)
        constrain(stackView, at: .right, to: borderView, diff: -1)
        clipsToBounds = true
        stackView.distribution = .fillEqually
        let setBorderWidth = borderWidth
        borderWidth = setBorderWidth
        let setBorderRadius = borderRadius
        borderRadius = setBorderRadius
        tintColorDidChange()
        borderView.isUserInteractionEnabled = false
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        accessibilityIdentifier = "MultiSelectSegmentedControl"
    }

    // MARK: Dividers

    private func showDividersBetweenSelectedSegments() {
        for i in 0..<dividers.count {
            let isHidden = segments[i].isSelected && segments[i + 1].isSelected
            dividers[i].alpha = isHidden ? 0 : 1
        }
    }

    private func insertDivider(afterSegment index: Int) {
        guard index >= 0, index < segments.count - 1 else { return }
        let segment = segments[index]
        let divider = UIView()
        divider.backgroundColor = actualTintColor
        dividers.insert(divider, at: index)
        addConstrainedSubview(divider)
        constrainDividerToControl(divider: divider)
        if isVertical {
            constrain(divider, at: .top, to: segment, at: .bottom)
            constrain(divider, at: .bottom, to: segments[index + 1], at: .top)
        } else {
            constrain(divider, at: .leading, to: segment, at: .trailing)
            constrain(divider, at: .trailing, to: segments[index + 1], at: .leading)
        }
    }

    private func removeDivider(at index: Int) {
        guard index >= 0, index < dividers.count else { return }
        dividers[index].removeFromSuperview()
        dividers.remove(at: index)
    }

    private func removeAllDividers() {
        dividers.forEach { $0.removeFromSuperview() }
        dividers.removeAll()
    }

    private func addAllDividers() {
        guard dividers.count < segments.count else { return }
        for i in dividers.count..<segments.count - 1 {
            insertDivider(afterSegment: i)
        }
        showDividersBetweenSelectedSegments()
    }

    private func constrainDividerToControl(divider: UIView) {
        if isVertical {
            constrain(divider, at: .left, diff: borderWidth)
            constrain(divider, at: .right, diff: -borderWidth)
        } else {
            constrain(divider, at: .top, diff: borderWidth)
            constrain(divider, at: .bottom, diff: -borderWidth)
        }
    }

    // MARK: Tap Gesture

    @objc
    func didTap(gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: self)
        guard let segment = hitTest(location, with: nil) as? MultiSelectSegment else { return }
        guard let index = segments.firstIndex(of: segment) else { return }
        perform(animated: true) {
            if self.allowsMultipleSelection {
                segment.isSelected.toggle()
                self.showDividersBetweenSelectedSegments()
            } else {
                if segment.isSelected { return }
                self.selectedSegmentIndex = index
            }
            self.sendActions(for: [.valueChanged, .primaryActionTriggered])
            self.delegate?.multiSelect(self, didChange: segment.isSelected, at: index)
        }
    }
}
