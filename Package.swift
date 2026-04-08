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
        .package(url: "https://github.com/idnow/docidv-ai-ios.git", exact: "1.6.0"),
        .package(url: "https://github.com/idnow/eid-sdk-ios.git", exact: "1.3.1")
    ],
    targets: [
        .binaryTarget(
            name: "DocIDVCommon",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.6.0/DocIDVCommon.xcframework.zip",
            checksum: "5735d0bdc73a03b661939dba97f8c75bbdde65be48008a3b287e5de688c3a564"
        ),
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.6.0/DocIDV.xcframework.zip",
            checksum: "b2d86674860238df31e2cebaccfa0ddfde6285e73b0373fb3166b5c18ba76fb7"
        ),
        .binaryTarget(
            name: "DocIDVAIModule",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.6.0/DocIDVAIModule.xcframework.zip",
            checksum: "3b8b67f9180c64f6c4e5a5ed95610a40211c14091260989e3756f469614c164c"
        ),
        .binaryTarget(
            name: "DocIDVEIDGovernikusModule",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.6.0/DocIDVEIDGovernikusModule.xcframework.zip",
            checksum: "714e00288690f7be68237efd036fabd0e02c10298c9f0c9d01105e62d9b902e1"
        ),
        .target(
            name: "DocIDV-Target-Wrapper",
            dependencies: [
                "DocIDV",
                "DocIDVCommon",
                "DocIDVAIModule",
                .product(name: "DocIDVAI", package: "docidv-ai-ios")
            ],
            path: "sources"
        ),
        .target(
            name: "EID-Governikus-Target-Wrapper",
            dependencies: [
                "DocIDV",
                "DocIDVCommon",
                "DocIDVAIModule",
                "DocIDVEIDGovernikusModule",
                .product(name: "DocIDVAI", package: "docidv-ai-ios"),
                .product(name: "IDnowEIDGovernikus", package: "eid-sdk-ios")
            ],
            path: "sources-eid-governikus"
        )
    ]
)
