// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIToast",
    products: [
        .library(name: "UIToast", targets: ["UIToast"]),
    ],
    targets: [
        .target(name: "UIToast"),
        .testTarget(name: "UIToastTests", dependencies: [
            .target(name: "UIToast"),
        ]),
    ]
)
