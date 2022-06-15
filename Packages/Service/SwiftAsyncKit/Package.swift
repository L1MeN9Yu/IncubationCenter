// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAsyncKit",
    platforms: [
        .macOS("10.15"),
        .iOS("13.0"),
        .tvOS("13.0"),
        .watchOS("6.0"),
    ],
    products: [
        .library(name: "SwiftAsyncKit", targets: ["SwiftAsyncKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-async-algorithms", from: "0.0.1"),
    ],
    targets: [
        .target(name: "SwiftAsyncKit", dependencies: [
            .product(name: "AsyncAlgorithms", package: "swift-async-algorithms"),
        ]),
        .testTarget(name: "SwiftAsyncKitTests", dependencies: [
            .target(name: "SwiftAsyncKit"),
        ]),
    ]
)
