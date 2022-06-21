// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIFeedback",
    products: [
        .library(name: "UIFeedback", targets: ["UIFeedback"]),
    ],
    targets: [
        .target(name: "UIFeedback", dependencies: []),
        .testTarget(name: "UIFeedbackTests", dependencies: [
            .target(name: "UIFeedback"),
        ]),
    ]
)
