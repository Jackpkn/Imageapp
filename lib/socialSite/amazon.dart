import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AmazonScr extends StatefulWidget {
  const AmazonScr({Key? key}) : super(key: key);

  @override
  State<AmazonScr> createState() => _AmazonScrState();
}

class _AmazonScrState extends State<AmazonScr> {
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
        //   centerTitle: true,
        //   title: const Text(
        //     'Amozon',
        //     style: TextStyle(color: Colors.teal, fontSize: 12),
        //   ),
        // ),
        body: SafeArea(
          child: WebView(
            initialUrl: "https://www.amazon.in",
            //initialUrl: "https://www.youtube.com",
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
            controller.loadUrl('https://www.amazon.in');
          },
        ),
      ),
    );
  }
}

// class AmazonSc extends StatefulWidget {
//   final String url;
//   const AmazonSc({Key? key, required this.url}) : super(key: key);

//   @override
//   State<AmazonSc> createState() => _AmazonScState();
// }

// class _AmazonScState extends State<AmazonSc> {
//   late WebViewController controller;
//   late WebViewController url;
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (await controller.canGoBack()) {
//           controller.goBack();
//           return false;
//         } else {
//           return true;
//         }
//       },
//       child: Scaffold(
//         // appBar: AppBar(
//         //   elevation: 0.0,
//         //   centerTitle: true,
//         //   title: const Text(
//         //     'Amozon',
//         //     style: TextStyle(color: Colors.teal, fontSize: 12),
//         //   ),
//         // ),
//         body: SafeArea(
//           child: WebView(
//             // initialUrl: "https://www.amazon.in",
//             initialUrl: url.toString(),
//             //initialUrl: "https://www.youtube.com",
//             javascriptMode: JavascriptMode.unrestricted,
//             onWebViewCreated: (controller) {
//               this.controller = controller;
//             },
//           ),
//         ),
//       ),
//     );
//   }
 
// }

  