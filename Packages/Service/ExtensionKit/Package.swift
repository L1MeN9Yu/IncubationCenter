// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExtensionKit",
    products: [
        .library(name: "ExtensionKit", targets: ["ExtensionKit"]),
    ],
    targets: [
        .target(name: "ExtensionKit"),
        .testTarget(name: "ExtensionKitTests", dependencies: [
            .target(name: "ExtensionKit"),
        ]),
    ]
)
