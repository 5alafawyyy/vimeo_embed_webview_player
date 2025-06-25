import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vimeo_embed_webview_player/vimeo_embed_webview_player.dart';

void main() {
  group('VimeoEmbedWebviewPlayerScreen', () {
    testWidgets('should create widget with required parameters', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: VimeoEmbedWebviewPlayerScreen(
            vimeoURL: 'https://vimeo.com/123456789',
          ),
        ),
      );

      expect(find.byType(VimeoEmbedWebviewPlayerScreen), findsOneWidget);
    });

    testWidgets('should create widget with all parameters', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: VimeoEmbedWebviewPlayerScreen(
            vimeoURL: 'https://vimeo.com/123456789/abcdefgh',
            isFullScreen: true,
            isAutoPlay: false,
          ),
        ),
      );

      expect(find.byType(VimeoEmbedWebviewPlayerScreen), findsOneWidget);
    });

    test('should parse Vimeo URL correctly', () {
      final widget = VimeoEmbedWebviewPlayerScreen(
        vimeoURL: 'https://vimeo.com/123456789',
      );

      expect(widget.vimeoURL, equals('https://vimeo.com/123456789'));
      expect(widget.isFullScreen, isFalse);
      expect(widget.isAutoPlay, isTrue);
    });

    test('should parse Vimeo URL with hash correctly', () {
      final widget = VimeoEmbedWebviewPlayerScreen(
        vimeoURL: 'https://vimeo.com/123456789/abcdefgh',
      );

      expect(widget.vimeoURL, equals('https://vimeo.com/123456789/abcdefgh'));
    });
  });
}
