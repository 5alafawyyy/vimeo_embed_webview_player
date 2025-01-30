import 'package:flutter/material.dart';
import 'package:vimeo_embed_webview_player/vimeo_embed_webview_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Vimeo Player Example')),
        body: const VimeoEmbedWebviewPlayerScreen(
          vimeoURL: 'https://vimeo.com/1051061734',
        ),
      ),
    );
  }
}
