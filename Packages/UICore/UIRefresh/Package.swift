// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIRefresh",
    products: [
        .library(name: "UIRefresh", targets: ["UIRefresh"]),
    ],
    targets: [
        .target(name: "UIRefresh"),
        .testTarget(name: "UIRefreshTests", dependencies: [
            .target(name: "UIRefresh"),
        ]),
    ]
)
