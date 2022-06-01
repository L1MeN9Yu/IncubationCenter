// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RubikCube",
    products: [
        .library(name: "RubikCube", targets: ["RubikCube"]),
    ],
    targets: [
        .target(name: "RubikCube"),
        .testTarget(name: "RubikCubeTests", dependencies: [
            .target(name: "RubikCube"),
        ]),
    ]
)
