// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "viper",
    products: [
        .library(name: "VIPER", targets: ["VIPER"]),
    ],
    targets: [
        .target(name: "VIPER", dependencies: []),
    ]
)
