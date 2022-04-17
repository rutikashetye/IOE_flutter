import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class next_page_live extends StatefulWidget {
  const next_page_live({required this.title, required this.link});
  final String title;
  final String link;
  @override
  State<StatefulWidget> createState() {
    return _next_page_live_state();
  }
}

class _next_page_live_state extends State<next_page_live> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
              fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Image(
          image: AssetImage(widget.link),
          height: 1000,
          width: 1000,
        ),
      ),
      // body: WebView(
      //   initialUrl: widget.link,
      //   javascriptMode: JavascriptMode.unrestricted,
      //   onWebViewCreated: (WebViewController webViewController) {
      //     _controller.complete(webViewController);
      //   },
      // ),
    );
  }
}