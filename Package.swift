// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "AlertController",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AlertController",
            targets: ["AlertController"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "AlertController",
            dependencies: []
        ),
        .testTarget(
            name: "AlertControllerTests",
            dependencies: ["AlertController"]),
    ]
)
