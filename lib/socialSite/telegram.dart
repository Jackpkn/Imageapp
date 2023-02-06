import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Telegram extends StatefulWidget {
  Telegram({Key? key}) : super(key: key);

  @override
  State<Telegram> createState() => _TelegramState();
}

class _TelegramState extends State<Telegram> {
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
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text(
            'Telegram',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: WebView(
            initialUrl: "https://web.telegram.org",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: ((controller) {
              this.controller = controller;
            }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.import_export,
            size: 32,
          ),
          onPressed: () async {
            controller.loadUrl('https://web.telegram.org');
          },
        ),
      ),
    );
  }
}
