import 'package:firebaseapp/users/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Hotstar extends StatefulWidget {
 const Hotstar({Key? key}) : super(key: key);

  @override
  State<Hotstar> createState() => _HotstarState();
}

class _HotstarState extends State<Hotstar> {
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
            initialUrl: "http://www.hotstar.com/",
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



// "https://www.sonyliv.com/listing/live-tv-400_363"
/*

sony liv 
hotstar

*/