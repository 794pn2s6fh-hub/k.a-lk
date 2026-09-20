// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ErosionUIBridge",
    platforms: [.iOS(.v26)],
    products: [
        .library(name: "ErosionUIBridge", type: .dynamic, targets: ["ErosionUIBridge"])
    ],
    dependencies: [
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.20")
    ],
    targets: [
        .target(
            name: "BadQuery",
            path: "Sources/ErosionBadQuery",
            publicHeadersPath: "include"
        ),
        .target(
            name: "ErosionUIBridge",
            dependencies: ["BadQuery", .product(name: "ZIPFoundation", package: "ZIPFoundation")],
            path: "Sources/ErosionUIBridge"
        )
    ]
)
