import 'package:firebaseapp/users/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YoutubeScreen extends StatefulWidget {
  YoutubeScreen({Key? key}) : super(key: key);

  @override
  State<YoutubeScreen> createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
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
        //     'Youtube',
        //     style: TextStyle(
        //       color: Colors.red,
        //     ),
        //   ),
        // ),
        body: SafeArea(
          child: WebView(
            //zoomEnabled: true,
            initialUrl: "https://www.youtube.com",
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
