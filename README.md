# Vimeo Embed WebView Player

A Flutter package for embedding and playing Vimeo videos seamlessly using a WebView. This package allows developers to integrate Vimeo video playback into their Flutter apps with ease and flexibility.

---

## Features

- **Embed Vimeo videos** using a simple URL.  
- **Autoplay control** with customizable options.  
- **Fullscreen mode support** for immersive viewing.  
- **Cross-platform compatibility** with Android and iOS.  
- **Optimized WebView performance** with improved URL parsing.  
- **Lightweight and easy to use** with minimal setup. 

---

## Demo  
<p align="center">
  <img src="https://raw.githubusercontent.com/5alafawyyy/vimeo_embed_webview_player/master/demo.gif" width="300"/>
</p>

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
  vimeo_embed_webview_player: ^0.0.6
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
          vimeoURL: 'https://vimeo.com/1051061734',
        ),
      ),
    );
  }
}
```

---

## Features in Detail  

1. **Simple Integration**  
   Just pass a Vimeo video URL to the `VimeoEmbedWebviewPlayerScreen` widget, and the video will render inside a WebView.  

2. **Autoplay Control**  
   Set `isAutoPlay` to `true` or `false` to enable or disable autoplay functionality.  

3. **Fullscreen Mode**  
   When `isFullScreen` is `true`, the player enters landscape mode for an immersive experience.  

4. **Optimized URL Parsing**  
   Automatically extracts video ID and hash from Vimeo URLs, ensuring correct playback.  

5. **Cross-Platform Compatibility**  
   Works seamlessly on both Android and iOS with enhanced WebView configurations.  

---

## Additional Information

- For more details, visit the [GitHub repository](https://github.com/5alafawyyy/vimeo_embed_webview_player).
- Contributions are welcome! Feel free to open issues or submit pull requests.
- For support, contact the package maintainer at ahmedkhallaf1098@gmail.com.
```

### **What’s New in This Version (0.0.5)?**
- **Removed `webview_flutter_wkwebview` dependency** for better compatibility.  
- **Added `isFullScreen` and `isAutoPlay` parameters** for enhanced customization.  
- **Improved WebView performance and loading efficiency**.  
- **Better URL parsing logic** to handle various Vimeo URL formats.  
- **Updated documentation with structured function descriptions**.  
