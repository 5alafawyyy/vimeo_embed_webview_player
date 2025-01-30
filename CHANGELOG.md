## 0.0.5

- Removed `webview_flutter_wkwebview` dependency.
- Refactored `VimeoEmbedWebviewPlayerScreen` to improve flexibility and maintainability.
- Added `isFullScreen` parameter to enable fullscreen video playback.
- Added `isAutoPlay` parameter to allow optional autoplay control.
- Improved URL parsing logic to handle different Vimeo URL formats more reliably.
- Optimized WebView initialization and loading performance.
- Enhanced screen orientation and system UI handling when entering/exiting fullscreen mode.
- Improved autoplay simulation by triggering user interaction programmatically.
- Cleaned up and structured the documentation with detailed function descriptions.
- Updated `dispose` method to reset orientation and clear WebView cache properly.

## 0.0.4

- Added Android support for Vimeo video embedding.
- Improved autoplay functionality for seamless video playback.
- Updated documentation and README with detailed usage instructions.

## 0.0.3

- Enhanced WebView customization options for iOS and macOS.
- Fixed minor bugs related to URL parsing and WebView loading.
- Added unit tests for `VimeoEmbedWebviewPlayerScreen`.

## 0.0.2

- Improved stability and performance for iOS devices.
- Resolved issues with autoplay functionality on macOS.
- Updated example app with a more detailed implementation.

## 0.0.1

- Initial release.
- Supports Vimeo video embedding with autoplay.
- iOS and macOS support.

