# Changelog

## [1.11.0] - 2025-07-23
### Added
- Download pdf as a zip in QES
- Support 13 characters in IdentID

### Fixed
- Fix wrong fraud detection
- Fallback issue on NFC
- T&C links translation

## [1.10.0] - 2025-06-25
### Added
- Update ReadID
- Update eID
- Update Sunflower
- Signature page extraction
### Fixed
- Error sent when the used starts an already finished token.
- Accessibility on links

## [1.8.0] - 2025-05-18
### Added
- QES support

### Fixed
- Fixed a crash when the SDK is used in a Swift 6 app.
- Fixed the issue where two error screens where shown in a row.

## [1.7.0] - 2025-04-30
### Added
- Update eID Governikus version to 1.3.4

## [1.6.0] - 2025-03-31
### Added
- eID Governikus feature support

## [1.4.0] - 2025-03-02
### Added
- Automatic recovery when connection is lost and restored during identification.

### Fixed
- Several bugfixes and technical improvements. 

## [1.3.0] - 2025-02-12
### Added
- Full country names translation in screens

### Fixed
- Stability enhancements about

## [1.2.0] - 2025-01-22
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