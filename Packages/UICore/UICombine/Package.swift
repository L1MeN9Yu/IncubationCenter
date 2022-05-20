// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UICombine",
    platforms: [.iOS(.v10)],
    products: [
        .library(name: "UICombine", targets: ["UICombine"]),
    ],
    dependencies: [
        .package(url: "https://github.com/CombineCommunity/CombineCocoa.git", from: "0.4.0"),
    ],
    targets: [
        .target(name: "UICombine", dependencies: [
            .product(name: "CombineCocoa", package: "CombineCocoa"),
        ]),
        .testTarget(name: "UICombineTests", dependencies: [
            .target(name: "UICombine"),
        ]),
    ]
)
