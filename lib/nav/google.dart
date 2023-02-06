import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleScreen extends StatefulWidget {
  const GoogleScreen({Key? key}) : super(key: key);

  @override
  State<GoogleScreen> createState() => _GoogleScreenState();
}

class _GoogleScreenState extends State<GoogleScreen> {
  late WebViewController controller;
  double progress = 0;
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
        //   actions: [
        //     IconButton(
        //       onPressed: () async {
        //         if (await controller.canGoBack()) {
        //           controller.goBack();
        //         }
        //       },
        //       icon: const Icon(
        //         Icons.arrow_back,
        //         color: Colors.green,
        //       ),
        //     ),
        //     LinearProgressIndicator(
        //       value: progress,
        //       color: Colors.red,
        //       backgroundColor: Colors.black,
        //     ),
        //     CircularProgressIndicator(
        //       strokeWidth: 2.0,
        //       value: progress,
        //       color: Colors.green,
        //       backgroundColor: Colors.orange,
        //     ),
        //     IconButton(
        //       onPressed: () => controller.reload(),
        //       icon: const Icon(
        //         Icons.refresh,
        //         color: Colors.green,
        //       ),
        //     ),
        //   ],
        //   title: const Text(
        //     'Google',
        //     style: TextStyle(
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
        body: SafeArea(
          child: WebView(
            initialUrl: "https://google.com",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              this.controller = controller;
            },
            // onProgress: (progress) =>
            //     setState(() => this.progress = progress / 100,
            //     ),
          ),
        ),
         floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.import_export,
            size: 32,
          ),
          onPressed: () async {
            controller.loadUrl('https://google.com');
          },
        ),
      ),
      
    );
  }
}

  