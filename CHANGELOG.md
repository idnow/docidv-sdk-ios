# Changelog

## [1.15.0] - 2026-10-15
### Added
- Support unissey liveness in a webview flow
- Add a new "Before Starting" informational screen

### Fixed
- Fixed Trustpilot rating screen not appearing after identification completion
- Fix expired session issue

## [1.14.0] - 2026-09-24
### Added
- Support the multiple documents flow
- New OTP confirmation mode using email adress
- Update Unissey to version 5.0.0
- Update Sunflower to version 2.2.2
- Update eID Governikus to version 1.5.1
- Update default theme with new redesigned IDnow brand (colors and fonts)
- Support new EU citizen card

## [1.13.0] - 2026-09-03
### Added
- Added error screen when QES flow is started without documents configured
- Open privacy policy link and terms & conditions link within the app/SDK without opening a browser

## [1.12.0] - 2026-08-13
### Added
- Update eID 
- Update Sunflower

### Fixed
- Fixed an issue that could cause the app to freeze when retrying a QES identification
- Fixed some NFC issues

## [1.11.0] - 2026-07-23
### Added
- Download pdf as a zip in QES
- Support 13 characters in IdentID

### Fixed
- Fix wrong fraud detection
- Fallback issue on NFC
- T&C links translation

## [1.10.0] - 2026-06-25
### Added
- Update ReadID
- Update eID
- Update Sunflower
- Signature page extraction
### Fixed
- Error sent when the used starts an already finished token.
- Accessibility on links

## [1.8.0] - 2026-05-18
### Added
- QES support

### Fixed
- Fixed a crash when the SDK is used in a Swift 6 app.
- Fixed the issue where two error screens where shown in a row.

## [1.7.0] - 2026-04-30
### Added
- Update eID Governikus version to 1.3.4

## [1.6.0] - 2026-03-31
### Added
- eID Governikus feature support

## [1.4.0] - 2026-03-02
### Added
- Automatic recovery when connection is lost and restored during identification.

### Fixed
- Several bugfixes and technical improvements. 

## [1.3.0] - 2026-02-12
### Added
- Full country names translation in screens

### Fixed
- Stability enhancements about

## [1.2.0] - 2026-01-22
### Added
- Further progress toward full WCAG 2.1 compliance.
- More components updated for improved accessibility.
- Liveness now accessible across multiple backend vendor options.
- Configurable design themes tailored to customer requirements.
- Custom Lottie animations now supported.

### Changed
- Overall UX refinements

### Fixed
- Functional and accessibility bug fixes
- Stability enhancements

## [1.1.0] - 2025-12-22
### Fixed
- Fixed a liveness video issue when a NFC flow completed before

## [1.1.0] - 2025-11-19
### Added
- Screen redesign to comply with iOS accessibility guidelines.
- Support for light and dark mode.
- Adjustable text size and spacing (honors system preferences).
- Improved compatibility with Voice Over (labels, focus order, actions).

### Changed
- Enhanced color contrast for better readability.
- Visible and consistent focus indicators.
- Proper content descriptions for images and icons.
- Clear announcements for component states (error, selected, disabled, progress).

### Fixed
- Optimized memory usage and app responsiveness.
- Several bugfixes to improve user experience.

## [1.0.0] - 2025-06-24
### Added
- Initial version of the DocIDV SDK with the AutoIdent flow support