//
// Created by Mengyu Li on 2022/6/20.
//

import UIKit

public class ImpactGenerator {
    private lazy var generators = [UIImpactFeedbackGenerator.FeedbackStyle: UIImpactFeedbackGenerator]()

    init() {}
}

public extension ImpactGenerator {
    subscript(style: UIImpactFeedbackGenerator.FeedbackStyle) -> UIImpactFeedbackGenerator {
        set { fatalError("") }
        get {
            switch generators[style] {
            case let .some(impactFeedbackGenerator):
                return impactFeedbackGenerator
            case .none:
                let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: style)
                generators[style] = impactFeedbackGenerator
                impactFeedbackGenerator.prepare()
                return impactFeedbackGenerator
            }
        }
    }
}
