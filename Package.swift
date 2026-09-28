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
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.14.0/DocIDVCommon.xcframework.zip",
            checksum: "1f6b6870b5697d1d9824b58e5e39e3671b3ffbd85147fc649af11fb05f3207c3"
        ),
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.14.0/DocIDV.xcframework.zip",
            checksum: "0e86562a7ed9c23ee53ad9eed8ff9f7458b96184df6d1131076df29ba4490b08"
        ),
        .binaryTarget(
            name: "DocIDVAIModule",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.14.0/DocIDVAIModule.xcframework.zip",
            checksum: "b15d290d8e1a44d86bb5827778380a5d780b8720d34ddbfb31286a24dc51f60e"
        ),
        .binaryTarget(
            name: "DocIDVAI",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.14.0/DocIDVAI.xcframework.zip",
            checksum: "88369d70d300b9a918635d55a44aecbb03d615584566c1fb6d117b477e7a3bde"
        ),
        .binaryTarget(
            name: "DocIDVEIDGovernikusModule",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.14.0/DocIDVEIDGovernikusModule.xcframework.zip",
            checksum: "1bf0f81cbf204bd0ad93de98fb09174037d32ce7c7c72b06360aaa81650aee3d"
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
