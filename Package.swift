// swift-tools-version:5.9
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
            name: "EID-Governikus",
            targets: ["EID-Governikus-Target-Wrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/idnow/eid-sdk-ios.git", exact: "1.5.1"),
        .package(url: "https://github.com/unissey/sdk-ios.git", exact: "5.0.0"),
        .package(url: "https://github.com/idnow/sunflower-sdk-ios.git", exact: "2.2.2")
    ],
    targets: [
        .binaryTarget(
            name: "DocIDVCommon",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.15.0/DocIDVCommon.xcframework.zip",
            checksum: "39c4b9a7adc360ab4fac9a7b0f29c19a9ecddb8373da55321ee0bd1f743d1cb9"
        ),
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.15.0/DocIDV.xcframework.zip",
            checksum: "4a0b123c6da9edc98a3f86ac0941c82df1076dd9d0fb8ebabd05be21e0bfb229"
        ),
        .binaryTarget(
            name: "DocIDVAIModule",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.15.0/DocIDVAIModule.xcframework.zip",
            checksum: "66787147dbed7814fff53b82d57b7d66d1bea855dfae6d9a1c60af12380cf632"
        ),
        .binaryTarget(
            name: "DocIDVAI",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.15.0/DocIDVAI.xcframework.zip",
            checksum: "96f2b40e54fa2d6d6e730ee1dd8167f39aa7bf33bcb0a8e77dc1d8e69d564a31"
        ),
        .binaryTarget(
            name: "DocIDVEIDGovernikusModule",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.15.0/DocIDVEIDGovernikusModule.xcframework.zip",
            checksum: "42bfba378b2cbcc8be9b596c67e1a21ea506def7172196ee2b3ff9ac5a844103"
        ),
        .binaryTarget(
            name: "FaceTecSDK",
            path: "Frameworks/FaceTecSDK.xcframework"
        ),
        .binaryTarget(
            name: "ReadID_UI",
            path: "Frameworks/ReadID_UI.xcframework"
        ),
        .target(
            name: "DocIDV-Target-Wrapper",
            dependencies: [
                // Local DocIDV sdk binaries
                "DocIDV",
                "DocIDVCommon",
                "DocIDVAIModule",
                "DocIDVAI",
                // External frameworks saved locally
                "FaceTecSDK",
                "ReadID_UI",
                // External public frameworks
                .product(name: "UnisseySdk", package: "sdk-ios"),
                .product(name: "SunflowerUIKit", package: "sunflower-sdk-ios")
            ],
            path: "sources"
        ),
        .target(
            name: "EID-Governikus-Target-Wrapper",
            dependencies: [
                // Local DocIDV sdk binaries
                "DocIDV",
                "DocIDVCommon",
                "DocIDVAIModule",
                "DocIDVAI",
                "DocIDVEIDGovernikusModule",
                // External frameworks saved locally
                "FaceTecSDK",
                "ReadID_UI",
                // External public frameworks
                .product(name: "UnisseySdk", package: "sdk-ios"),
                .product(name: "IDnowEIDGovernikus", package: "eid-sdk-ios")
            ],
            path: "sources-eid-governikus"
        )
    ]
)
