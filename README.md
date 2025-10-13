# Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Code Example](#code-example)
- [SDK error codes](#sdk-error-codes)
  - [How to deal with errors](#how-to-deal-with-errors)
- [Fat Framework Support](#fat-framework-support)
- [Compatibility](#compatibility-matrix)

## Introduction

The DocIDV framework incorporates the IDnow platform into iOS apps. We offer 2 SDK variants as xcframeworks with and without the Bank transfer feature.

- DocIDV
- DocIDV-without-XS2A

Please choose the corresponding setup required for your use cases, and please reach out to IDnow to obtain the necessary dependencies.
Note: 3rd Party components such as Video Selfies and NFC scanning do not support the dynamic runtime language customization using the preferredLanguage parameter. These components always use the device_language.
Hence, our recommended best practice for optimal user experience is to allow the SDK to use the device language instead of the preferredlanguage parameter.

By leveraging the NFC capability (Near Field Communication), our SDK can read out the data of the NFC chips of electronic IDs & Passports, which adds an extra layer of security to digital identity verification. This will boost the identity verification process and increase the level of fraud protection.
We support ICAO 9303 documents (passports, ID cards, residence permits): please contact IDnow for more information.

## Installation

The DocIDV sdk is only available via Swift Package manager

- Add swift package: `https://github.com/idnow/io.idnow.docidv.ios` as a dependency
- Put ReadID_UI.xcframework, UnisseySdk.xcframework and FaceTecSDK.xcframework in the app folder (please reach out to IDnow to obtain the xcframeworks)
- XCode -> Target -> General -> Frameworks, Libraries and Embedded Content -> Add above frameworks and and check Embed and Sign.
- On the Signing & Capabilities configuration tab, add the Capability ‘Near Field Communication Tag Reading’
- Add ‘NFCReaderUsageDescription’ to your App’s Info.plist file
- Copy the snippet below into your App’s Info.plist file

```
<key>com.apple.developer.nfc.readersession.iso7816.select-identifiers</key> <array>
<string>A0000002471001</string>
<string>A00000045645444C2D3031</string>
</array>

```

- To support PACE-only French ID cards issued from 2020 onwards, on iOS 16+, your app needs to have the correct entitlement. In the project navigator, select the entitlement file for your application
  There should be an entry Near Field Communication Tag Reader Session Formats with one sub-item Item 0 (Near Field Communication Tag Reader Session Format) with a value of Tag-Specific Data Protocol (TAG). Select this line and click on the + icon. A new line should appear, starting with Item 1.
  Change the value of the new line to Password Authenticated Connection Establishment (PACE)

- Add NSCameraUsageDescription and NSPhotoLibraryUsageDescription keys in your App's .plist file
- Insert SDK calling code in your app: [Code Example](#code-example)
- Compile & Run

## Usage

### Starting an automated ident

The API to start an automated Ident is:

```
public func start(token: String, preferredLanguage: String = default, fromViewController: UIViewController, listener: @escaping IDnowSDKResultListener)
```

- The token needs to be all uppercase characters only and should conform to the following regular expression `.{3}-.{5}$`
- Setting the preferredLanguage (optional) tells the SDK in which language the AutoIdent UI should be shown. If the language is not available the framework first tries the language of the device and if that is not available it falls back to English.

**Language limitations:**
3rd Party components such as Video Selfie and NFC scanning do not support the dynamic runtime language customization using the preferredLanguage parameter. These components always use the device_language.
Hence, our recommended best practice for optimal user experience is to allow the SDK to use the device language instead of the preferredLanguage parameter.

**Supported Languages**
These ISO 639-1 language codes are currently supported: bg (Bulgarian), cs (Czech), da (Danish), de (German), el (Greek), en (English), es (Spanish), et (Estonian), fi (Finnish), fr (French), hr (Croatian), hu (Hungarian), it (Italian), ja (Japanese), ka (Georgian), ko (Korean), lt (Lithuanian), lv (Latvian), nb (Norwegian), nl (Dutch), pl (Polish), pt (Portuguese), ro (Romanian), ru (Russian), sk (Slovak), sl (Slovenian), sr (Serbian-latin), sv (Swedish), tr (Turkish), zh (Chinese).

- the calling view controller
- an IDnowSDKResultListener which gets called once the SDK returns. The possible return codes are:
  ** FINISHED the ident was finished
  ** CANCELLED The user canceled the ident
  \*\* ERROR an error occurred

### Code example

```

IDnowSdk.shared.start(token: token, preferredLanguage: preferredLanguage, fromViewController: controller,
                                  listener:{ (result: IDnowSdk.IdentResult.type, statusCode: IDnowSdk.IdentResult.statusCode, message: String) in
            if result == .ERROR {
                self.showAlert(text: statusCode.description)
            } else if result == .FINISHED {

            }
        })
```

## SDK error codes

In the case of IDNowSDK.IdentResult.type.ERROR: The possible error codes are below.

```
"EUnreachable" --> No network connection
"E10" --> General type of error
"E100" --> Ident code syntax incorrect
"E101" --> Ident code not found
"E102" --> Ident code expired
"E103" --> Ident code already completed
"E110" --> Get ident info failed; invalid response
"E111" --> Get ident info failed; server reachability
"E112" --> Get ident info failed; Internal error
"E120" --> Parsing error
"E121" --> Server error
"E130" --> Get ident resources failed; invalid response
"E131" --> Get ident resources failed; server reachability
"E140" --> Get name failed; invalid response
"E141" --> Get name failed; server reachability
"E142" --> Get name failed; full name missing
"E150" --> Start ident failed; invalid response
"E151" --> Start ident failed; server reachability
"E152" --> Start ident failed; missing session key
"E153" --> Start ident failed; wrong ident method
"E160" --> Get Emirates NFC resources failed; invalid response
"E161" --> Get Emirates NFC resources failed; server reachability
"E170" --> Socket connection force closed
"E171" --> Process force closed

```

## How to deal with errors

- For E102 it is recommended to create another ident and restart the process with the new ident code.
- For E103 it is recommended to show a screen to the user with the message that they have submitted all the information needed and that they should wait for the final result.
- For E170 it is recommended to notify the user that the ident process timed out or was started on a different device and ask them to try again.
- For all other error codes, it is recommended to show a generic error for the user and ask them to try again by restarting the process.

### Fat Framework Support

In case you want to use the fat framework, please get in touch with your IDnow representative.

### Compatibility Matrix

Please refer to the following link to find information about compatibility, end-of-support (EOS), and end-of-life (EOL) dates for our products: [IDnow Compatibility Matrix: Browser & OS Compatibility guide](https://www.idnow.io/developers/compatibility-overview/)
