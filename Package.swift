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
        .package(url: "https://github.com/idnow/eid-sdk-ios.git", exact: "1.3.9"),
        .package(url: "https://github.com/unissey/sdk-ios.git", exact: "4.0.0"),
        .package(url: "https://github.com/idnow/sunflower-sdk-ios.git", exact: "2.1.11")
    ],
    targets: [
        .binaryTarget(
            name: "DocIDVCommon",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.13.0/DocIDVCommon.xcframework.zip",
            checksum: "60fa9a3f8392b8d97013890b990a7288499cb3abe7d4726b37c2a11d209c2852"
        ),
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.13.0/DocIDV.xcframework.zip",
            checksum: "8cd144e8ef2246720668493070807bea3ef6105b15826550c95e1ba8614fb9cc"
        ),
        .binaryTarget(
            name: "DocIDVAIModule",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.13.0/DocIDVAIModule.xcframework.zip",
            checksum: "97ed9d641d7386b9f004edc9930a5cf588edaafc0b94694c1680fb955feec8ef"
        ),
        .binaryTarget(
            name: "DocIDVAI",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.13.0/DocIDVAI.xcframework.zip",
            checksum: "d4b88ba7ee6c6d1dc34295f2d955d5e9aa5aa6265bc8a01a9119e5beb85e0a4a"
        ),
        .binaryTarget(
            name: "DocIDVEIDGovernikusModule",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.13.0/DocIDVEIDGovernikusModule.xcframework.zip",
            checksum: "74917330e42bea065ab61b1562b7cb0879c2389aa3e2abc6782c9dfd53913bc2"
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
