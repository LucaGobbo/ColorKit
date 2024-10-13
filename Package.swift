// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ColorKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13), .macOS(.v13), .tvOS(.v13), .visionOS(.v1),
    ],
    products: [
        .library(
            name: "ColorKit",
            targets: ["ColorKit"]),
        .library(
            name: "ColorKitSwiftUI",
            targets: ["ColorKitSwiftUI"]),
    ],
    targets: [
        .target(
            name: "ColorKit"),

        .target(
            name: "ColorKitSwiftUI",
            dependencies: ["ColorKit"]),

        .testTarget(
            name: "ColorKitTests",
            dependencies: ["ColorKit"],
            resources: [.process("Resources")]),
        
            .testTarget(
                name: "ColorKitSwiftUITests",
                dependencies: ["ColorKitSwiftUI"],
                resources: [.process("Resources")]),
    ],
    swiftLanguageModes: [.v6]
)
