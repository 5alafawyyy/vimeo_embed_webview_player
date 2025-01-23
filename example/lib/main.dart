import 'package:flutter/material.dart';
import 'package:vimeo_player/vimeo_player.dart';

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
        body: const VimeoPlayerScreen(vimeoURL: 'https://vimeo.com/123456789'),
      ),
    );
  }
}
