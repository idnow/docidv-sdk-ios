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
        .package(url: "https://github.com/idnow/sunflower-sdk-ios.git", exact: "1.4.10"),
        .package(url: "https://github.com/unissey/sdk-ios.git", exact: "4.0.0"),
    ],
    targets: [
        // Define our 2 SDK internal binaries and their location.
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.1.0/DocIDV.xcframework.zip",
            checksum: "646ba82794fdbb253d66a763a8f991d0c3adc80ef4495c9a95791f885fcefc7c"
        ),
        .binaryTarget(
            name: "DocIDV-without-XS2A",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.1.0/DocIDV-without-XS2A.xcframework.zip",
            checksum: "b0886e3b2a37d76822bfa2fc1c0b5cd290da3dbf11e610081261cdd0729d5000"
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
