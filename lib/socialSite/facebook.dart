import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Facebook extends StatefulWidget {
  const Facebook({Key? key}) : super(key: key);

  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: WebView(
              initialUrl: "https://www.facebook.com",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                this.controller = controller;
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.import_export,
            size: 32,
          ),
          onPressed: () async {
            controller.loadUrl('https://www.facebook.com');
          },
        ),
      ),
    );
  }
}
