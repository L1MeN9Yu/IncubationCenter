//
// Created by Mengyu Li on 2022/6/20.
//

import UIKit

public class SelectionGenerator {
    private lazy var generator: UISelectionFeedbackGenerator = {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        return generator
    }()

    init() {}
}

public extension SelectionGenerator {
    var shared: UISelectionFeedbackGenerator { generator }
}
