// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ScaffoldKit",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ScaffoldKit",
            targets: ["ScaffoldKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", from: "2.1.1")
    ],
    targets: [
        .target(
            name: "ScaffoldKit",
            path: "Sources/ScaffoldKit"
        )
    ]
)
