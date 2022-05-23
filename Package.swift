// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TodoApp-CLI",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .executable(name: "todo", targets: ["TodoApp-CLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "TodoApp-CLI",
            dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")]),
        .testTarget(
            name: "TodoApp-CLITests",
            dependencies: ["TodoApp-CLI"]),
    ]
)
