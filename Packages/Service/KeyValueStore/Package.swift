// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KeyValueStore",
    products: [
        .library(name: "KeyValueStore", targets: ["KeyValueStore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/L1MeN9Yu/DataConvert.git", from: "1.0.0"),
        .package(url: "https://github.com/L1MeN9Yu/Asura.git", from: "2.1.0"),
        .package(path: "../Coder"),
        .package(path: "../Locks"),
        .package(path: "../AppModular"),
    ],
    targets: [
        .target(name: "KeyValueStore", dependencies: [
            .product(name: "DataConvert", package: "DataConvert"),
            .product(name: "LMDB", package: "Asura"),
            .product(name: "Coder", package: "Coder"),
            .product(name: "Locks", package: "Locks"),
            .product(name: "AppModular", package: "AppModular"),
        ]),
        .testTarget(name: "KeyValueStoreTests", dependencies: [
            .target(name: "KeyValueStore"),
        ]),
    ]
)
