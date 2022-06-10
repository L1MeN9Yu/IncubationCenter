// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProxyServer",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
    ],
    products: [
        .library(name: "ProxyServer", targets: ["ProxyServer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swhitty/FlyingFox.git", from: "0.7.0"),
    ],
    targets: [
        .target(name: "ProxyServer", dependencies: [
            .product(name: "FlyingFox", package: "FlyingFox"),
        ]),
        .testTarget(name: "ProxyServerTests", dependencies: [
            .target(name: "ProxyServer"),
        ]),
    ]
)
