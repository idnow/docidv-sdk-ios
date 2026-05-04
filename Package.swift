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
        .package(url: "https://github.com/idnow/eid-sdk-ios.git", exact: "1.3.4"),
        .package(url: "https://github.com/unissey/sdk-ios.git", exact: "4.0.0"),
        .package(url: "https://github.com/idnow/sunflower-sdk-ios.git", exact: "2.1.8")
    ],
    targets: [
        .binaryTarget(
            name: "DocIDVCommon",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.8.0/DocIDVCommon.xcframework.zip",
            checksum: "2f78f357e75f42308c4449da451d5e75d39733b22be3c00d479830ac0cad7fe4"
        ),
        .binaryTarget(
            name: "DocIDV",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.8.0/DocIDV.xcframework.zip",
            checksum: "d92114a79b98dd8ed788577e5ae7702656e3842102342e77632cc1523b67eac1"
        ),
        .binaryTarget(
            name: "DocIDVAIModule",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.8.0/DocIDVAIModule.xcframework.zip",
            checksum: "87bd16d6563411450d3f9c9675d7b9eb2d9f2ee4ee568eaccf66ee78ba75f396"
        ),
        .binaryTarget(
            name: "DocIDVAI",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.8.0/DocIDVAI.xcframework.zip",
            checksum: "0c1073a33ee29282b4c97aa707a7463411621c4952d501411b3b1bd29fe4645e"
        ),
        .binaryTarget(
            name: "DocIDVEIDGovernikusModule",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.8.0/DocIDVEIDGovernikusModule.xcframework.zip",
            checksum: "887816ce64fe5b83b6130df2159f53f7a91d04fe6b8b9379f6f17140f760fdd7"
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
