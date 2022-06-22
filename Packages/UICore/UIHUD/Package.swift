// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIHUD",
    products: [
        .library(name: "UIHUD", targets: ["UIHUD"]),
    ],
    targets: [
        .target(name: "UIHUD"),
        .testTarget(name: "UIHUDTests", dependencies: [
            .target(name: "UIHUD"),
        ]),
    ]
)
