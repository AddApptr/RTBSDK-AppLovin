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
        .package(url: "https://github.com/AddApptr/RTBSDK.git", exact: "1.10.0-beta2"),
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
            url: "https://gravite-sdk-releases.s3.eu-central-1.amazonaws.com/rtbsdk/ios/spm/1.10.0-beta2/GraviteRTBAppLovinMediationAdapter.zip",
            checksum: "62fc8af86b14a6a7cbc504a57124b6040bf72361f112d909f6cfef698dac3300"
        ),
    ]
)
