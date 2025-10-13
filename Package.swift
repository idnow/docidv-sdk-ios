// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DocIDV",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "DocIDV",
            targets: [
                "DocIDV"
            ]),
        .library(
            name: "DocIDV-without-XS2A",
            targets: ["DocIDV-without-XS2A"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.0.0/DocIDV.xcframework.zip",
            checksum: "92dacbb96b8a2175ed3d292386e156ec01918ae3be1cfd967b3b7e1bfef3674b"
        ),
        .binaryTarget(
            name: "DocIDV-without-XS2A",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.0.0/DocIDV-without-XS2A.xcframework.zip",
            checksum: "b75f659d3aea7ebf93aeffa29d17e9042aba68a4ac6a831270dddc8890695de2"
        )
    ],
    swiftLanguageVersions: [.v5]
)

