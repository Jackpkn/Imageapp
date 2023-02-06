import 'package:firebaseapp/users/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Flipkart extends StatefulWidget {
  const Flipkart({Key? key}) : super(key: key);

  @override
  State<Flipkart> createState() => _FlipkartState();
}

class _FlipkartState extends State<Flipkart> {
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
            initialUrl: "https://www.flipkart.com/",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              this.controller = controller;
            },
          ),
        ),
         floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.import_export,
            size: 32,
          ),
          onPressed: () async {
            controller.loadUrl('https://www.flipkart.com/');
          },
        ),
      ),
      
    );
  }
}
