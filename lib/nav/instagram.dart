import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class instaScreen extends StatefulWidget {
  const instaScreen({Key? key}) : super(key: key);

  @override
  State<instaScreen> createState() => _instaScreenState();
}

class _instaScreenState extends State<instaScreen> {
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
        // appBar: AppBar(
        //   elevation: 0.0,
        //   backgroundColor: Colors.white,
        //   title: const Text(
        //     'Instagram',
        //     style: TextStyle(color: Color.fromARGB(255, 255, 64, 233)),
        //   ),
        // ),
        body: SafeArea(
          child: WebView(
            initialUrl: "https://www.instagram.com",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              this.controller = controller;
            },
          ),
        ),
        
      ),
    );
  }
}
