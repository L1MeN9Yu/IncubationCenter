// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoggerPool",
    products: [
        .library(name: "LoggerPool", targets: ["LoggerPool"]),
    ],
    dependencies: [
        .package(url: "https://github.com/L1MeN9Yu/Senna.git", from: "3.1.0"),
        .package(name: "Locks", path: "./Locks"),
    ],
    targets: [
        .target(name: "LoggerPool", dependencies: [
            .product(name: "Senna", package: "Senna"),
            .product(name: "Locks", package: "Locks"),
        ]),
        .testTarget(name: "LoggerPoolTests", dependencies: [
            .target(name: "LoggerPool"),
        ]),
    ]
)
