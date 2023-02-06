import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Spotify extends StatefulWidget {
  const Spotify({Key? key}) : super(key: key);

  @override
  State<Spotify> createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> {
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
        backgroundColor: Colors.black,
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
            initialUrl: "https://www.spotify.com",
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
