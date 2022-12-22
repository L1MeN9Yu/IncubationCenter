// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIBase",
    products: [
        .library(name: "UIBase", targets: ["UIBase"]),
    ],
    targets: [
        .target(name: "UIBase"),
        .testTarget(name: "UIBaseTests", dependencies: [
            .target(name: "UIBase"),
        ]),
    ]
)
