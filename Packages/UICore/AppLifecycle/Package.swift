// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppLifecycle",
    products: [
        .library(name: "AppLifecycle", targets: ["AppLifecycle"]),
    ],
    targets: [
        .target(name: "AppLifecycle"),
        .testTarget(name: "AppLifecycleTests", dependencies: [
            .target(name: "AppLifecycle"),
        ]),
    ]
)
