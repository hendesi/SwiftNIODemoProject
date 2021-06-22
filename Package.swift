// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Test",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.18.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.8.0"),
        .package(url: "https://github.com/apple/swift-nio-http2.git", from: "1.13.0"),
        .package(url: "https://github.com/nerdsupremacist/AssociatedTypeRequirementsKit.git", .branch("develop"))
//        .package(url: "https://github.com/nerdsupremacist/AssociatedTypeRequirementsKit.git", .upToNextMinor(from: "0.3.2")),
    ],
    targets: [
        .target(
            name: "Test",
            dependencies: [
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "NIOHTTP2", package: "swift-nio-http2"),
                .product(name: "NIOSSL", package: "swift-nio-ssl"),
                .product(name: "AssociatedTypeRequirementsKit", package: "AssociatedTypeRequirementsKit")
            ]
        ),
        .testTarget(
            name: "TestTests",
            dependencies: ["Test"]),
    ]
)
