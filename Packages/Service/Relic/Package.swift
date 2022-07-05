// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Relic",
    products: [
        .library(name: "Relic", targets: ["Relic"]),
    ],
    targets: [
        .target(name: "Relic"),
        .testTarget(name: "RelicTests", dependencies: [
            .target(name: "Relic"),
        ]),
    ]
)
