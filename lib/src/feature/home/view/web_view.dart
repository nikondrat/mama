import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  final String url;
  const WebView({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));

    return Scaffold(
        appBar: const CustomAppBar(),
        body: WebViewWidget(controller: controller));
  }
}
