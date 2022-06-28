// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIExtensionsKit",
    products: [
        .library(name: "UIExtensionsKit", targets: ["UIExtensionsKit"]),
    ],
    targets: [
        .target(name: "UIExtensionsKit"),
        .testTarget(name: "UIExtensionsKitTests", dependencies: [
            .target(name: "UIExtensionsKit"),
        ]),
    ]
)
