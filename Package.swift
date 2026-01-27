// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftCraft",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SwiftCraft",
            targets: ["SwiftCraft"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftCraft",
            path: "Sources/SwiftCraft"
        )
    ]
)
