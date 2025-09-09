// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "emoji-list",
  platforms: [
    .macOS(.v11)
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .executable(
      name: "emoji-list",
      targets: ["emoji-list"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.6.1"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .executableTarget(
      name: "emoji-list",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ],
    ),
  ]
)
