import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VimeoEmbedWebviewPlayerScreen extends StatefulWidget {
  /// Defines the vimeo URL to be played in the webview.
  ///
  /// [vimeoURL] is the URL of the Vimeo video to be played in the webview.
  final String vimeoURL;

  /// Defines whether the player should be in full screen mode.
  ///
  /// [isFullScreen] is a boolean value that determines whether the player should
  ///
  /// Default value is `false`.
  final bool isFullScreen;

  /// Defines whether the video should autoplay.
  ///
  /// [isAutoPlay] is a boolean value that determines whether the video should
  ///
  /// Default value is `true`.
  final bool isAutoPlay;

  const VimeoEmbedWebviewPlayerScreen({
    super.key,
    required this.vimeoURL,
    this.isFullScreen = false,
    this.isAutoPlay = true,
  });

  @override
  State<VimeoEmbedWebviewPlayerScreen> createState() =>
      _VimeoEmbedWebviewPlayerScreenState();
}

class _VimeoEmbedWebviewPlayerScreenState
    extends State<VimeoEmbedWebviewPlayerScreen> {
  final GlobalKey<State<StatefulWidget>> webviewKey =
      GlobalKey<State<StatefulWidget>>();
  WebViewController? webViewControler;
  String? id;
  String? hash;

  @override

  /// Initializes the state of the Vimeo embed webview player screen.
  ///
  /// Sets the screen to landscape mode and hides UI overlays if
  /// [widget.isFullScreen] is true. Parses the Vimeo URL to extract the video ID
  /// and hash, then constructs the video URL. Initializes the [WebViewController]
  /// and sets the JavaScript mode to unrestricted. If [widget.isAutoPlay] is true,
  /// sets up a navigation delegate to autoplay the video when the page starts loading.

  void initState() {
    super.initState();
    if (widget.isFullScreen) {
      SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ],
      );
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [],
      );
    }

    parseVimeoUrl(widget.vimeoURL);

    webViewControler = WebViewController();

    final url =
        'https://player.vimeo.com/video/$id${hash != null ? '?h=$hash' : ''}';

    webViewControler!.setJavaScriptMode(JavaScriptMode.unrestricted);
    if (widget.isAutoPlay) {
      webViewControler!.setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) async => await _autoPlay(),
        ),
      );
    }
    webViewControler!.loadRequest(Uri.parse(url));
  }

  /// Auto-plays the video in the WebView by simulating a tap in the middle of
  /// the WebView after a short delay.
  ///
  /// This is used to play the video automatically on mobile devices, which do
  /// not support auto-play by default.
  ///
  /// This function is called when [widget.isAutoPlay] is `true` and the WebView
  /// is loaded.
  Future<void> _autoPlay() async {
    await Future.delayed(const Duration(seconds: 2));
    _clickOnPage();
    await Future.delayed(const Duration(seconds: 2));
    _clickOnPage();
  }

  /// Simulates a tap in the middle of the WebView.
  ///
  /// This is used to auto-play the video when the WebView is loaded.
  ///
  /// The reason for this hack is that the WebView does not support auto-play on
  /// mobile devices, so we have to simulate a user tap to play the video. This
  /// function is only called when [widget.isAutoPlay] is `true` and the WebView
  /// is loaded.
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

  /// Parse a Vimeo URL and extract the video ID and hash if present.
  ///
  /// Accepts a URL in the following formats:
  ///
  /// - https://vimeo.com/123456789 (video ID)
  /// - https://vimeo.com/123456789/abcdefgh (video ID and hash)
  ///
  /// Prints an error message if the URL is invalid or doesn't contain a video ID.
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

  /// Releases any resources used by the player.
  ///
  /// If [widget.isFullScreen] is true, resets the screen orientation to
  /// portrait up and restores the default system UI overlays.
  ///
  /// Also calls [WebViewController.clearCache] to clear the webview's cache.
  void dispose() {
    if (widget.isFullScreen) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
    }
    webViewControler?.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      key: webviewKey,
      controller: webViewControler!,
    );
  }
}
