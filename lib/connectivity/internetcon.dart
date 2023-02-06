// import 'dart:async';
// import 'dart:io';

// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';

// class ConnectivityProvider with ChangeNotifier {
//   Connectivity _connectivity = Connectivity();

//   late bool _isOnline;
//   bool get isOnline => _isOnline;
  
//   startMonitoring() async {
//     await initConnectivity();
//     _connectivity.onConnectivityChanged.listen((
//       ConnectivityResult result,
//     ) async {
//       if (result == ConnectivityResult.none) {
//         _isOnline = false;
//         notifyListeners();
//       } else {
//         await _updateConnectionStatus().then((bool isConnected) {
//           _isOnline = isConnected;
//           notifyListeners();
//         });
//       }
//     });
//   }

//   Future<void> initConnectivity() async {
//     try {
//       var status = await _connectivity.checkConnectivity();

//       if (status == ConnectivityResult.none) {
//         _isOnline = false;
//         notifyListeners();
//       } else {
//         _isOnline = true;
//         notifyListeners();
//       }
//     } on PlatformException catch (e) {
//       print("PlatformException: " + e.toString());
//     }
//   }

//   Future<bool> _updateConnectionStatus() async {
//     bool isConnected = false;
//     try {
//       final List<InternetAddress> result =
//           await InternetAddress.lookup('google.com');
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         isConnected = true;
//       }
//     } on SocketException catch (_) {
//       isConnected = false;
//       //return false;
//     }
//     return isConnected;
//   }
// }

// class NoInternet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             height: 200,
//             width: 200,
//             margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/no-internet.png"),
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           const Text(
//             "No Internet Connection",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(15),
//             child: Text(
//               "You are not connected to the internet. Make sure Wi-Fi is on, Airplane Mode is Off and try again.",
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Internet Connectivity"),
//         backgroundColor: Colors.redAccent,
//       ),
//       body: pageUI(),
//     );
//   }

//   Widget pageUI() {
//     return Consumer<ConnectivityProvider>(
//       builder: (consumerContext, model, child) {
//         if (model.isOnline != null) {
//           return model.isOnline
//               ? const Center(
//                   child: Text(
//                     "Home Page",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                 )
//               : NoInternet();
//         }
//         return Container(
//           child: const Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       },
//     );
//   }
// }
