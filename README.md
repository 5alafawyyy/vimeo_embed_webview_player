# Vimeo Embed WebView Player

A Flutter package for embedding and playing Vimeo videos seamlessly using a WebView. This package allows developers to integrate Vimeo video playback into their Flutter apps with ease and flexibility.

---

## Features

- Embed Vimeo videos using a simple URL.
- Supports autoplay functionality.
- Compatible with both Android and iOS platforms.
- Fully customizable WebView integration for enhanced control.

---

## Getting Started

### Prerequisites
Before using this package, ensure you have the following:
- Flutter version `3.0.0` or above.
- Add `webview_flutter` dependencies to your project.

### Installation
Add the following to your `pubspec.yaml`:
```yaml
dependencies:
  vimeo_embed_webview_player: ^0.0.1
```

Run the command to fetch the package:
```bash
flutter pub get
```

---

## Usage

Here's a basic example of how to use the `vimeo_embed_webview_player` package:

### Example
```dart
import 'package:flutter/material.dart';
import 'package:vimeo_embed_webview_player/vimeo_embed_webview_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Vimeo Embed WebView Player Example')),
        body: const VimeoEmbedWebviewPlayerScreen(
          vimeoURL: 'https://vimeo.com/123456789?h=abc123',
        ),
      ),
    );
  }
}
```

---

## Features in Detail

1. **Simple Integration**:
   Pass a Vimeo video URL to the `VimeoPlayerScreen` widget, and the video will render in a WebView.

2. **Autoplay Support**:
   Videos autoplay when the widget is initialized, ensuring smooth playback.

3. **Cross-Platform Compatibility**:
   Works seamlessly on both Android and iOS with appropriate WebView configurations.

---

## Additional Information

- For more details, visit the [GitHub repository](https://github.com/5alafawyyy/vimeo_embed_webview_player).
- Contributions are welcome! Feel free to open issues or submit pull requests.
- For support, contact the package maintainer at ahmedkhallaf1098@gmail.com.
