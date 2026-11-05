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
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.19.0/DocIDVCommon.xcframework.zip",
            checksum: "ef14cbe8f90557ca445fa8573b34ceb853a5996541893b0af94f6aae6ce975cf"
        ),
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.19.0/DocIDV.xcframework.zip",
            checksum: "10e16ae9e609ce5bec0be4e4bbd2afb945716c866bfe6b001aa09f1fdca939c2"
        ),
        .binaryTarget(
            name: "DocIDVAIModule",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.19.0/DocIDVAIModule.xcframework.zip",
            checksum: "c1f1a8ab7a7fb14298fbe305ff60d60ace3f6b57efb4fdcbbe15e581c3869698"
        ),
        .binaryTarget(
            name: "DocIDVAI",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.19.0/DocIDVAI.xcframework.zip",
            checksum: "bb034072f1bbb9edc8f1e93629a7dd9c7222b2519f391041efd40353fbb660f4"
        ),
        .binaryTarget(
            name: "DocIDVEIDGovernikusModule",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.19.0/DocIDVEIDGovernikusModule.xcframework.zip",
            checksum: "842b6b0a8702a43a11d2b0282accf35d779c0d8038471c9e98c3a41d7a3d9f9d"
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
