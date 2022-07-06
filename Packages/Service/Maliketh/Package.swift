// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Maliketh",
    products: [
        .library(name: "Maliketh", targets: ["Maliketh"]),
    ],
    targets: [
        .target(name: "Maliketh"),
        .testTarget(name: "MalikethTests", dependencies: [
            .target(name: "Maliketh"),
        ]),
    ]
)
