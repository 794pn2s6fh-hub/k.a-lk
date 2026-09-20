# ErosionUIBridge

Minimal iOS SwiftUI bridge extracted from the supplied Erosion source.

## What it exports

`ErosionBridge.makeViewController()` is exposed to Objective-C as:

`+[ErosionBridge makeViewController]`

It creates:

```swift
let root = FMRootView()
    .environmentObject(ErosionManager.shared)
return UIHostingController(rootView: root)
```

`ErosionApp`, `ContentView`, `TweaksView`, and the `WindowGroup` lifecycle are intentionally excluded. The bridge is meant to provide the File Browser UI as a `UIViewController` that another UIKit application can present.

## Build without a Mac

The repository includes `.github/workflows/build.yml`. Push this directory to GitHub and run **Build ErosionUIBridge** from Actions. GitHub-hosted macOS runners include Xcode, so a physical Mac is not required for the CI build. The workflow produces `ErosionUIBridge.framework.zip` as an artifact.

## Important integration note

The framework is compiled for iOS and must be loaded by an iOS process with a compatible Swift runtime. It is not a standalone app and does not contain an application lifecycle.

## Source scope

The UI bridge keeps the File Browser code and its direct dependencies, including the supplied `bad_query` C implementation used by `FSHandlers`.
