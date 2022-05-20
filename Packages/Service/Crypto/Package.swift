// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Crypto",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v9),
        .tvOS(.v9),
        .watchOS(.v2),
    ],
    products: [
        .library(name: "Crypto", targets: ["Crypto"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.4.3"),
    ],
    targets: [
        .target(name: "Crypto", dependencies: [
            .product(name: "CryptoSwift", package: "CryptoSwift"),
        ]),
        .testTarget(name: "CryptoTests", dependencies: [
            .target(name: "Crypto"),
        ]),
    ]
)
