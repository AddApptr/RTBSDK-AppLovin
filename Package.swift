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
        .package(url: "https://github.com/AddApptr/RTBSDK.git", exact: "1.10.0-beta1"),
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
            url: "https://ios-sdk-rtb.gravite.net/RTBSDK_SPM/1.10.0-beta1/GraviteRTBAppLovinMediationAdapter.zip",
            checksum: "dd2e150376595e3ee2eceef51600ff86c9ce9d71dcf9b99043e1254810f59ed9"
        ),
    ]
)
