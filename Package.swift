// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Test",
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.18.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.8.0"),
        .package(url: "https://github.com/apple/swift-nio-http2.git", from: "1.13.0")
    ],
    targets: [
        .target(
            name: "Test",
            dependencies: [
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "NIOHTTP2", package: "swift-nio-http2"),
                .product(name: "NIOSSL", package: "swift-nio-ssl"),
            ]
        ),
        .testTarget(
            name: "TestTests",
            dependencies: ["Test"]),
    ]
)
