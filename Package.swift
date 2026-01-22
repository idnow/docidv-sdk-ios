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
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.2.0/DocIDV.xcframework.zip",
            checksum: "f6639f4e79164dc492209b55e7c84e528639d0df57e8bc42356a6fe48a029199"
        ),
        .binaryTarget(
            name: "DocIDV-without-XS2A",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.2.0/DocIDV-without-XS2A.xcframework.zip",
            checksum: "2023fb5cbba709a033c029e0aef2f2267618985e0159018ef23626ecf3189a7c"
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
