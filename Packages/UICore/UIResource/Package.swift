// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIResource",
    products: [
        .library(name: "UIResource", targets: ["UIResource"]),
    ],
    targets: [
        .target(name: "UIResource"),
        .testTarget(name: "UIResourceTests", dependencies: [
            .target(name: "UIResource"),
        ]),
    ]
)
