// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Locks",
    products: [
        .library(name: "Locks", targets: ["Locks"]),
    ],
    targets: [
        .target(name: "Locks"),
        .testTarget(name: "LocksTests", dependencies: [
            .target(name: "Locks"),
        ]),
    ]
)
