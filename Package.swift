// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RTBSDK-AppLovin",
    defaultLocalization: "en",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "RTB_GraviteRTBAppLovinMediationAdapter",
            targets: ["RTB_GraviteRTBAppLovinMediationAdapter"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/AddApptr/RTBSDK.git", exact: "1.11.0"),
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", .upToNextMinor(from: "13.5.1")),
    ],
    targets: [
        .target(
            name: "RTB_GraviteRTBAppLovinMediationAdapter",
            dependencies: [
                .product(name: "RTBSDK", package: "RTBSDK"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                "GraviteRTBAppLovinMediationAdapter",
            ],
            path: "./Sources/GraviteRTBAppLovinMediationAdapter"
        ),

        // Mark: Binary Targets
        .binaryTarget(
            name: "GraviteRTBAppLovinMediationAdapter",
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.11.0/GraviteRTBAppLovinMediationAdapter.zip",
            checksum: "64eb956cedc402e50034e20fb19eea0c26edfe843195771ef0c49520feec4c0b"
        ),
    ]
)
