import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChartWebViewPage extends StatefulWidget {
  const ChartWebViewPage({super.key});

  @override
  State<ChartWebViewPage> createState() => _ChartWebViewPageState();
}

class _ChartWebViewPageState extends State<ChartWebViewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(true)
      ..loadFlutterAsset('assets/chart.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}

