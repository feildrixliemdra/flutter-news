import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Article extends StatefulWidget {
  final String articleUrl;

  Article({@required this.articleUrl});

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: widget.articleUrl,
        onWebViewCreated: ((WebViewController webViewController) {
          _completer.complete(webViewController);
        }),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Flutter',
              style: TextStyle(color: Colors.black),
            ),
            Text('News', style: TextStyle(color: Colors.blue)),
          ],
        ),
        actions: <Widget>[
          Opacity(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
            ),
            opacity: 0,
          )
        ],
      ),
    );
  }
}
