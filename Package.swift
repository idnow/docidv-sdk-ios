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
            checksum: "ee841b27c66fa3a6487fe64d9d0f68f474e8de98f379ef394a464319f2f45251"
        ),
        .binaryTarget(
            name: "DocIDV-without-XS2A",
            url: "https://github.com/idnow/docidv-sdk-ios/releases/download/1.0.0/DocIDV-without-XS2A.xcframework.zip",
            checksum: "8ef40d028089d0d358bcddbcca528fb680301bacdf097e41abbe756d27d1315b"
        )
    ],
    swiftLanguageVersions: [.v5]
)

