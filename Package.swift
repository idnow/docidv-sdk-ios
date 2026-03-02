// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DocIDV",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "DocIDV",
            targets: ["DocIDV-Target-Wrapper"]
        ),
        .library(
            name: "DocIDV-without-XS2A",
            targets: ["DocIDV-without-XS2A-Target-Wrapper"]
        )
    ],
    // Define external dependencies (via SPM).
    dependencies: [
        .package(url: "https://github.com/idnow/sunflower-sdk-ios.git", exact: "2.1.4"),
        .package(url: "https://github.com/unissey/sdk-ios.git", exact: "4.0.0"),
    ],
    targets: [
        // Define our 2 SDK internal binaries and their location.
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.4.0/DocIDV.xcframework.zip",
            checksum: "b0895023a5ea4448305edc7588a1f5464f195df129dd3cb89ba33986b3e0c6a9"
        ),
        .binaryTarget(
            name: "DocIDV-without-XS2A",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.4.0/DocIDV-without-XS2A.xcframework.zip",
            checksum: "33df1038bc3484a0f0f4bf69525a7f0d880501b8aaf9dbc4cbaffe72b5d60c3c"
        ),
        // Define the third parties dependencies imported locally.
        .binaryTarget(
            name: "FaceTecSDK",
            path: "Frameworks/FaceTecSDK.xcframework"
        ),
        .binaryTarget(
            name: "ReadID_UI",
            path: "Frameworks/ReadID_UI.xcframework"
        ),
        // Define a wrapper which will encapsulate every dependencies in it.
        .target(
            name: "DocIDV-Target-Wrapper",
            dependencies: [
                // Local DocIDV sdk binaries.
                "DocIDV",
                // External frameworks saved locally.
                "FaceTecSDK",
                "ReadID_UI",
                // External public frameworks.
                .product(name: "UnisseySdk", package: "sdk-ios"),
                .product(name: "SunflowerUIKit", package: "sunflower-sdk-ios")
            ],
            path: "sources/DocIDV" // Path to an empty .swift file, needed by SPM.
        ),
        // Define a wrapper for 2nd target without XS2A library.
        .target(
            name: "DocIDV-without-XS2A-Target-Wrapper",
            dependencies: [
                // Local DocIDV sdk binaries (without XS2A lib).
                "DocIDV-without-XS2A",
                // External frameworks saved locally.
                "FaceTecSDK",
                "ReadID_UI",
                // External public frameworks.
                .product(name: "UnisseySdk", package: "sdk-ios"),
                .product(name: "SunflowerUIKit", package: "sunflower-sdk-ios")
            ],
            path: "sources/DocIDV-without-XS2A" // Path to another empty .swift file, needed by SPM.
        )
    ]
)
