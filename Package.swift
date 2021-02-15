// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "SwiftGen",
    products: [
        .executable(name: "swiftgen", targets: ["SwiftGen"]),
        .library(name: "SwiftGenKit", targets: ["SwiftGenKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/Commander.git", from: "0.9.0"),
        .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.0"),
        .package(url: "https://github.com/kylef/Stencil.git", from: "0.14.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "4.0.0"),
        .package(url: "https://github.com/SwiftGen/StencilSwiftKit.git", from: "2.8.0"),
        .package(url: "https://github.com/tid-kijyun/Kanna.git", from: "5.2.2")
    ],
    targets: [
        .target(name: "SwiftGen", dependencies: [
          "Commander",
          "Kanna",
          "PathKit",
          "Stencil",
          "StencilSwiftKit",
          "SwiftGenKit",
          "Yams"
        ]),
        .target(name: "SwiftGenKit", dependencies: [
          "Kanna",
          "PathKit",
          "Yams"
        ]),
        .testTarget(name: "SwiftGenKitTests", dependencies: [
          "SwiftGenKit"
        ]),
        .testTarget(name: "SwiftGenTests", dependencies: [
          "SwiftGen"
        ]),
        .testTarget(name: "TemplatesTests", dependencies: [
          "StencilSwiftKit",
          "SwiftGenKit"
        ])
    ],
    swiftLanguageVersions: [.v5]
)
