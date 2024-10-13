// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ColorKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14), .macOS(.v13), .tvOS(.v14), .visionOS(.v1),
    ],
    products: [
        .library(name: "ColorKit", targets: ["ColorKit"])
    ],
    targets: [
        .target(name: "ColorKit"),

        .testTarget(
            name: "ColorKitTests",
            dependencies: ["ColorKit"],
            resources: [.process("Resources")]),

        .testTarget(
            name: "ColorKitSwiftUITests",
            dependencies: ["ColorKit"],
            resources: [.process("Resources")]),
    ],
    swiftLanguageModes: [.v6]
)
