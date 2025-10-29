// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WireGuardKit",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v12)
    ],
    products: [
        .library(name: "WireGuardKit", targets: ["WireGuardKit"])
    ],
    dependencies: [
        .package(name: "wg-go-apple", url: "https://github.com/soo20987/wg-go-apple", .branch("master"))
    ],
    targets: [
        .target(
            name: "WireGuardKit",
            dependencies: ["WireGuardKitGo", "WireGuardKitC"]
        ),
        .target(
            name: "WireGuardKitC",
            dependencies: [],
            publicHeadersPath: "."
        ),
        .target(
            name: "WireGuardKitGo",
            dependencies: [],
            exclude: [
                "goruntime-boottime-over-monotonic.diff",
                "go.mod",
                "go.sum",
                "api-apple.go",
                "Makefile"
            ],
            publicHeadersPath: ".",
            linkerSettings: [.linkedLibrary("wg-go")]
        )
    ]
)
