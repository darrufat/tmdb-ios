// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Packages",
    products: [
        .library(
            name: "Packages",
            targets: ["Packages"]),
    ],
    targets: [
        .target(
            name: "Packages"),
        .testTarget(
            name: "PackagesTests",
            dependencies: ["Packages"]),
    ]
)
