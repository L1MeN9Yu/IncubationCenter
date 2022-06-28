// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UISegment",
    products: [
        .library(name: "UISegment", targets: ["UISegment"]),
    ],
    targets: [
        .target(name: "UISegment"),
        .testTarget(name: "UISegmentTests", dependencies: [
            .target(name: "UISegment"),
        ]),
    ]
)
