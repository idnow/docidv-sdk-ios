# DocIDV - IDnow

[![Platform](https://img.shields.io/badge/Platform-iOS-brightgreen.svg)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5.0-blue.svg)](https://developer.apple.com/swift/)
[![iOS](https://img.shields.io/badge/iOS-14.0-red.svg)](https://developer.apple.com/swift/)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange)

## Table of Contents

- [About](#about)
- [Key Features](#key-features)
- [Requirements](#requirements)
  - [Compatibility Matrix](#compatibility-matrix)
- [Installation](#installation)
  - [Import SDK](#import-sdk)
  - [Configure Your App](#configure-your-app)
- [Integration](#integration)
  - [Initializing and starting the SDK](#initializing-and-starting-the-SDK)
  - [Handling results and errors](#handling-results-and-errors)
- [Sample App](#sample-app)
- [Additional Features](#additional-features)
  - [Dark Mode & Theming](#dark-mode--theming)
  - [Localization](#localization)
- [Accessibility](#accessibility)
- [Support and more information](#support-and-more-information)
- [License](#license)

## About
Welcome to the IDnow DocIDV project. This repository provides the official Swift Package for the DocIDV iOS SDK, which enables you to capture identity documents using the device's camera, performing several security checks and offering various other features.

The DocIDV framework incorporates the IDnow platform into your iOS app.

This guide provides a quick overview of how to install, set up, and integrate the SDK. For
the complete integration guide, customization options, and API reference, see the official
documentation at **[doc.idnow.de/sdk/ios/overview](https://doc.idnow.de/sdk/ios/overview)**.

## Key Features

* **OCR**: Identity document capture.
* **OTP**: Phone number verification.
* **Liveness**: Liveness check for a secure flow.
* **NFC**: NFC chip scanning.
* **eID**: German electronic identity (eID) chip reading via Governikus.
* And many other features!

## Requirements

* **Minimum deployment version:** iOS 14.0.
* **Swift:** 5.0.

### Compatibility Matrix

Please refer to the following link to find information about current versions, compatibility,
end-of-support (EOS) and end-of-life (EOL) dates pertaining to our products:
[IDnow Compatibility Matrix: Browser & OS Compatibility guide](https://www.idnow.io/developers/compatibility-overview/).

## Installation

Follow these steps to integrate the DocIDV library into your application.

### Import SDK

The DocIDV SDK is available exclusively through Swift Package Manager (SPM).
1. Copy the official SPM repository URL: `https://github.com/idnow/docidv-sdk-ios`
2. In Xcode, navigate to `File` > `Add Package Dependencies...` and paste the URL.
3. Choose the desired package version. We recommend selecting "Up to Next Major Version" to receive compatible updates automatically. Click `Add Package`.
4. Add to your application's target `DocIDV` Package Product.
5. Add additional features you need. Example, if you need eID, add `EID-Governikus` to your application's target.

Here is how it will look in Xcode:

![package_target_selection](./img/package_target_selection.png)

6. Click `Add Package`.

📥 DocIDV is now imported into your project.
Note that Xcode has also imported several other libraries that our SDK depends on. You will find them in the `Package Dependencies` list in the Project Navigator.

### Configure Your App

To use our SDK, you need to configure your project to allow the use of the camera and NFC.

#### Entitlements File

1. Open your entitlements file (If you don't already have one, File > New File > Property List, and name it, e.g., `YourApp.entitlements`).
2. Add a new key `Near Field Communication Tag Reader Session Formats` of type `Array`.
3. In this array, add an item:
    - key: `Item 0 (Near Field Communication Tag Reading Session Format)`
    - value: `Tag-Specific Data Protocol (TAG)`

#### Info.plist File

1. Open your main `Info.plist` file.
2. Add a new key `ISO7816 application identifiers for NFC Tag Reader Session` of type `Array`.
3. Add the following two strings to this array:
   - `A00000045645444C2D3031`
   - `A0000002471001`
4. Add an entry for `Privacy - NFC Scan Usage Description` that describes why your app needs to use NFC.
5. Add an entry for `Privacy - Camera Usage Description` that describes why your app needs to use the camera.
6. Add an entry for `Privacy - Photo Library Usage Description` that describes why your app needs to store photos on the device.
7. If you use the video call feature, please add `Privacy - Microphone Usage Description` that describes the use of the microphone for calls with an agent.

👏 You are now ready to integrate the DocIDV SDK.

## Integration
### Initializing and starting the SDK
Here is an example of how to launch the SDK from your host app:

```swift
func startDocIDV() async {
  do {
    try await IDnowDocIDV.shared.start(token: token,
                                       isRoutedSession: isRoutedSession,
                                       preferredLanguage: preferredLanguage,
                                       viewController: viewController,
                                       bindingKey: bindingKey)
    // Handle success
  } catch let error {
    // Handle errors
  }
}
```
This code calls the main `start` method to launch the DocIDV library. It takes several parameters:

| Parameter | Type | Description |
|---|---|---|
| `token` | `String` | The identification token provided for the session. |
| `isRoutedSession` | `Bool` | Boolean which can be set by customers to allow resuming an ident that was started from another side. |
| `preferredLanguage` | `String` | The preferred language code for the SDK, e.g., `"fr"`. Defaults to English (`"en"`) if not specified. |
| `viewController` | `UIViewController` | The view controller that will present the SDK. It is also used to determine the appearance mode (light/dark) from your app. |
| `bindingKey` | `String` | Used for device binding use cases. It helps establish a correlation between a user's verified identity and their mobile device. This is particularly useful for device authentication and re-authentication scenarios. The `bindingKey` for a completed identification can be fetched via an API endpoint and compared with the one used during SDK initialization. |

Most parameters are optional. In its simplest form, the SDK only needs a `token` and a
`viewController`:

```swift
try await IDnowDocIDV.shared.start(token: token,
                                   viewController: viewController)
```

### Handling results and errors

In case of an error, the `start` method will throw the error. The error is an `IDnowDocIDVError`. Here is an enum describing each case:
```swift
public enum IDnowDocIDVError: Error {
    case cancelled(reason: AbortReason, message: String)
    case token(error: TokenError, message: String)
    case network(error: NetworkError, message: String)
    case internalError(code: Int, message: String)
}
```

#### Handling Specific Errors
##### Token errors
```swift
public enum TokenError {
    case formatError
    case notFound
    case expiredOrDeleted
    case alreadyCompleted
    case viToken
}
```
#### How to deal with errors

* **TokenError.expiredOrDeleted** — Create another ident and restart the process with the new ident code.
* **TokenError.alreadyCompleted** — Show a screen informing the user that they have submitted all required information and should wait for the final result.
*   For the internal error with a `170` code (Timeout), it is recommended to notify the user that the session timed out or was started on a different device and ask them to try again.
*   For all other error codes, it is recommended to show a generic error message and ask the user to try restarting the process.

🎉 That's it! DocIDV can now be launched from your host app.

## Sample App

A minimal SwiftUI sample app is included in this repository under [`SampleApp/`](./SampleApp).
It shows the smallest possible integration: enter an identification token, tap **Start the
SDK**, and handle the success/error result.

To run it:

1. Open `SampleApp/docidvsample.xcodeproj` in Xcode.
2. Select the `docidvsample` scheme and a **real device** as the run destination (NFC and
   the camera are not available in the Simulator).
3. Set your own signing team in *Signing & Capabilities*.
4. Build and run, paste a valid identification token, and tap **Start the SDK**.

The relevant integration code lives in
[`SampleApp/docidvsample/ContentView.swift`](./SampleApp/docidvsample/ContentView.swift),
and the required camera/NFC/microphone permissions are already declared in the sample's
`info.plist` and `docidvsample.entitlements` — a handy reference when configuring your own app.

## Additional Features

### Dark Mode & Theming

Each screen of the SDK natively supports dark mode and automatically adopts your app's
appearance settings (light, dark, or system default). Configurable design themes and custom Lottie animations are also supported to tailor the experience to your brand.

### Localization

You can configure the SDK to use a specific language. The following ISO 639-1 language codes are currently supported:

bg (Bulgarian), cs (Czech), da (Danish), de (German), el (Greek), en (English), es (Spanish), et (Estonian), fi (Finnish), fr (French), hr (Croatian), hu (Hungarian), it (Italian), ja (Japanese), ka (Georgian), ko (Korean), lt (Lithuanian), lv (Latvian), nb (Norwegian), nl (Dutch), pl (Polish), pt (Portuguese), ro (Romanian), ru (Russian), sk (Slovak), sl (Slovenian), sr (Serbian), sv (Swedish), tr (Turkish), zh (Chinese).

> **Best Practice:** For an optimal user experience, allow the SDK to use the device language instead of setting a specific `lang_code`.

> **Language Limitations:** Some components that rely on 3rd party technologies, such as Biometric Liveness or NFC scanning, do not support dynamic localization and use the device language.

## Accessibility

DocIDV is built with accessibility in mind, following iOS accessibility guidelines and
working toward WCAG 2.1 compliance. It supports the standard iOS assistive technologies:

* **VoiceOver:** meaningful labels, logical focus order, custom actions, and clear
  announcements for component states (error, selected, disabled, progress).
* **Dynamic Type:** adjustable text size and spacing that honor the user's system
  preferences.
* **Content descriptions:** proper descriptions for images and icons.

## Support and more information

* 📚 **Full documentation:** [doc.idnow.de/sdk/ios/overview](https://doc.idnow.de/sdk/ios/overview)
* 🛟 **Support portal:** [support.idnow.io](https://support.idnow.io/s/) — for technical
  questions or to raise an issue. You can also reach out to your account manager.
* See the [CHANGELOG](./CHANGELOG.md) for release notes.

## License

Use of the DocIDV SDK is governed by the IDnow SDK License Agreement. See [LICENSE.txt](./LICENSE.txt) for the full terms.

Copyright © 2026 IDnow GmbH. All rights reserved.
