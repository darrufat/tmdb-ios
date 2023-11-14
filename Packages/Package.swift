// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Packages",
    platforms: [
        .iOS("17.0")
    ],
    products: [
        // MARK: - App Features
        .library(
            name: "DiscoverMovies",
            targets: ["DiscoverMovies"]),

        .library(
            name: "MovieDetail",
            targets: ["MovieDetail"]),

        // MARK: - Domain Layer
        .library(
            name: "Domain",
            targets: ["Domain"]),

        // MARK: - Data Layer
        .library(
            name: "Data",
            targets: ["Data"]),

        // MARK: - Core
        .library(
            name: "Common",
            targets: ["Common"]
        ),

        // MARK: - Libraries
        .library(
            name: "HTTPClient",
            targets: ["HTTPClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Factory.git", .upToNextMajor(from: "2.3.0")),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.9.1"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.13.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "12.0.0"),
        //.package(url: "https://github.com/apple/swift-testing.git", branch: "main"), To be used when Swift 5.10 is released
    ],
    targets: [
        // MARK: - Application
        .target(
            name: "DiscoverMovies",
            dependencies: ["Common", "Kingfisher", "Domain"],
            path: "Sources/Application/DiscoverMovies"),
        .testTarget(
            name: "DiscoverMoviesTests",
            dependencies: ["DiscoverMovies", "Nimble"],
            path: "Tests/Unit/DiscoverMoviesTests"),
        .testTarget(
            name: "DiscoverMoviesSnapshotTests",
            dependencies: [
                "DiscoverMovies",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ],
            path: "Tests/Snapshot/DiscoverMoviesSnapshotTests",
            exclude: ["__Snapshots__"]
        ),
        .target(
            name: "MovieDetail",
            dependencies: ["Kingfisher", "Domain"],
            path: "Sources/Application/MovieDetail"),
        .testTarget(
            name: "MovieDetailTests",
            dependencies: ["MovieDetail", "Nimble"],
            path: "Tests/Unit/MovieDetailTests"),
        .testTarget(
            name: "MovieDetailSnapshotTests",
            dependencies: [
                "MovieDetail",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ],
            path: "Tests/Snapshot/MovieDetailSnapshotTests",
            exclude: ["__Snapshots__"]
        ),
        .target(
            name: "Domain",
            dependencies: ["Factory"],
            path: "Sources/Application/Domain"
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain", "Nimble"],
            path: "Tests/Unit/DomainTests"
        ),
        .target(
            name: "Data",
            dependencies: ["Common", "Domain", "Factory", "HTTPClient"],
            path: "Sources/Application/Data"
        ),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data", "Nimble"],
            path: "Tests/Unit/DataTests"
        ),

        // MARK: - Core
        .target(
            name: "Common",
            path: "Sources/Core/Common"
        ),

        // MARK: - Libraries
        .target(
            name: "HTTPClient",
            dependencies: ["Factory"],
            path: "Sources/HTTPClient"
        ),
        .testTarget(
            name: "HTTPClientTests",
            dependencies: ["HTTPClient"],
            path: "Tests/Unit/HTTPClientTests"
        ),
    ]
)
