library;

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart'
    as webviewios;

class VimeoPlayerScreen extends StatefulWidget {
  final String vimeoURL;

  const VimeoPlayerScreen({super.key, required this.vimeoURL});

  @override
  State<VimeoPlayerScreen> createState() => _VimeoPlayerScreenState();
}

class _VimeoPlayerScreenState extends State<VimeoPlayerScreen> {
  final GlobalKey<State<StatefulWidget>> webviewKey =
      GlobalKey<State<StatefulWidget>>();
  WebViewController? webViewControler;
  String? id;
  String? hash;

  @override
  void initState() {
    super.initState();
    parseVimeoUrl(widget.vimeoURL);

    if (Platform.isIOS &&
        WebViewPlatform.instance is webviewios.WebKitWebViewPlatform) {
      final iosParams = webviewios.WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
      );
      webViewControler =
          WebViewController.fromPlatformCreationParams(iosParams);
    } else {
      webViewControler = WebViewController();
    }

    webViewControler!
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) async => await _autoPlay(),
        ),
      )
      ..loadRequest(Uri.parse('https://player.vimeo.com/video/$id?h=$hash'));
  }

  Future<void> _autoPlay() async {
    await Future.delayed(const Duration(seconds: 2));
    _clickOnPage();
    await Future.delayed(const Duration(seconds: 2));
    _clickOnPage();
  }

  void _clickOnPage() {
    final renderBox =
        webviewKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final center = renderBox.localToGlobal(renderBox.paintBounds.center);
    GestureBinding.instance.handlePointerEvent(
        PointerDownEvent(position: center, kind: PointerDeviceKind.touch));
    GestureBinding.instance.handlePointerEvent(
        PointerUpEvent(position: center, kind: PointerDeviceKind.touch));
  }

  void parseVimeoUrl(String vimeoURL) {
    final uri = Uri.tryParse(vimeoURL);
    if (uri == null || !uri.host.contains('vimeo.com')) {
      debugPrint('Invalid Vimeo URL');
      return;
    }

    final segments = uri.pathSegments;
    if (segments.length >= 2) {
      id = segments[segments.length - 2];
      hash = segments.last;
    } else if (segments.isNotEmpty) {
      id = segments.last;
    }

    debugPrint('Extracted ID: $id, Hash: $hash');
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      key: webviewKey,
      controller: webViewControler!,
    );
  }
}
