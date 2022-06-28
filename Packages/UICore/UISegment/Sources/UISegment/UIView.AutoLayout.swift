//
// Created by Mengyu Li on 2022/6/27.
//

import UIKit

extension UIView {
    @discardableResult func constrain(
        _ at: NSLayoutConstraint.Attribute,
        to: CGFloat = 0,
        ratio: CGFloat = 1,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        identifier: String? = nil
    ) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(
            item: self, attribute: at, relatedBy: relation,
            toItem: nil, attribute: .notAnAttribute, multiplier: ratio, constant: to
        )
        constraint.priority = priority
        constraint.identifier = identifier
        addConstraintWithoutConflict(constraint)
        return constraint
    }

    @discardableResult func constrain(
        _ subview: UIView,
        at: NSLayoutConstraint.Attribute,
        diff: CGFloat = 0,
        ratio: CGFloat = 1,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        identifier: String? = nil
    ) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(
            item: subview, attribute: at, relatedBy: relation,
            toItem: self, attribute: at, multiplier: ratio, constant: diff
        )
        constraint.priority = priority
        constraint.identifier = identifier
        addConstraintWithoutConflict(constraint)
        return constraint
    }

    @discardableResult
    func constrain(
        _ subview: UIView,
        at: NSLayoutConstraint.Attribute,
        to subview2: UIView,
        at at2: NSLayoutConstraint.Attribute = .notAnAttribute,
        diff: CGFloat = 0,
        ratio: CGFloat = 1,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required,
        identifier: String? = nil
    ) -> NSLayoutConstraint {
        let at2real = at2 == .notAnAttribute ? at : at2
        let constraint = NSLayoutConstraint(
            item: subview, attribute: at, relatedBy: relation,
            toItem: subview2, attribute: at2real, multiplier: ratio, constant: diff
        )
        constraint.priority = priority
        constraint.identifier = identifier
        addConstraintWithoutConflict(constraint)
        return constraint
    }

    @discardableResult func addConstrainedSubview(_ subview: UIView, constrain: NSLayoutConstraint.Attribute...) -> [NSLayoutConstraint] {
        addConstrainedSubview(subview, constrainedAttributes: constrain)
    }

    @discardableResult func addConstrainedSubview(_ subview: UIView, constrainedAttributes: [NSLayoutConstraint.Attribute]) -> [NSLayoutConstraint] {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        return constrainedAttributes.map { self.constrain(subview, at: $0) }
    }
}

private extension UIView {
    func addConstraintWithoutConflict(_ constraint: NSLayoutConstraint) {
        removeConstraints(constraints.filter {
            constraint.firstItem === $0.firstItem
                && constraint.secondItem === $0.secondItem
                && constraint.firstAttribute == $0.firstAttribute
                && constraint.secondAttribute == $0.secondAttribute
        })
        addConstraint(constraint)
    }
}
