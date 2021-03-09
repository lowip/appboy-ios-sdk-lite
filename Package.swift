// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Appboy_iOS_SDK",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v9)
  ],
  products: [
    .library(name: "AppboyKit", type: .static, targets: ["AppboyKit"]),
    .library(name: "AppboyUI", targets: ["AppboyUI"]),
    .library(name: "AppboyPushStory", targets: ["AppboyPushStory"])
  ],
  dependencies: [
    .package(name: "SDWebImage", url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.8.2")
  ],
  targets: [
    .binaryTarget(
      name: "AppboyKitLibrary",
      url: "https://conscious-selection.surge.sh/AppboyKitLibrary.xcframework.zip",
      checksum: "958021ab550256974bec5c7d8174e5953e3a1e986ff6acadf96f17bfe2e1a053"
    ),
    .target(
      name: "AppboyKit",
      dependencies: ["SDWebImage", "AppboyKitLibrary"],
      path: "AppboyKit",
      resources: [
        .process("Appboy.bundle"),
        .process("headers/AppboyKitLibrary/ZipArchive_LICENSE.txt")
      ],
      linkerSettings: [
        .linkedFramework("SystemConfiguration"),
        .linkedFramework("QuartzCore"),
        .linkedFramework("CoreImage"),
        .linkedFramework("CoreText"),
        .linkedFramework("WebKit"),
        .linkedFramework("UserNotifications"),
        .linkedFramework("StoreKit"),
        .linkedFramework("CoreTelephony", .when(platforms: [.iOS])),
        .linkedLibrary("z"),
      ]
    ),
    .target(
      name: "AppboyUI",
      dependencies: ["AppboyKit"],
      path: "AppboyUI",
      resources: [
        .process("ABKNewsFeed/Resources"),
        .process("ABKInAppMessage/Resources"),
        .process("ABKContentCards/Resources")
      ],
      publicHeadersPath: "include/AppboyUI"
    ),
    .binaryTarget(
      name: "AppboyPushStoryFramework",
      url: "https://conscious-selection.surge.sh/AppboyPushStoryFramework.xcframework.zip",
      checksum: "3b65f489eda8cc0e54fa37c8eca9dc2ddc8c6e00f76559fca1a282963faba73a"
    ),
    .target(
      name: "AppboyPushStory",
      dependencies: ["AppboyPushStoryFramework"],
      path: "AppboyPushStory",
      resources: [
        .process("Resources/ABKPageView.nib")
      ]
    )
  ]
)
