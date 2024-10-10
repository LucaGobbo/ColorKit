// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ColorKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13), .macOS(.v13), .tvOS(.v13), .visionOS(.v1)
    ],
    products: [
        .library(
            name: "ColorKit",
            targets: ["ColorKit"]),
    ],
    targets: [
        .target(
            name: "ColorKit",
            path: "ColorKit/ColorKit"),
        .testTarget(
            name: "ColorKitTests",
            dependencies: ["ColorKit"],
            path: "ColorKit/ColorKitTests",
            resources: [.process("Resources")]),
    ],
    swiftLanguageModes: [.v6]
)
