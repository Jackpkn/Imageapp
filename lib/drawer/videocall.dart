// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';

// import 'package:agora_rtc_engine/rtc_engine.dart';
// import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
// import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

// const appId = "a0f19cae9a0b4563abd41239921ac2fd";
// const token =
//     '007eJxTYPhXr9NevnPJ2WfXTrK4lDjMF9vwffuKiRmLLn8RnfPR0OqDAkOiQZqhZXJiqmWiQZKJqZlxYlKKiaGRsaWlkWFislFayj517WSrSp1k2/cRDIxQCOLzMKRlFhWXJGck5uWl5jAwAABywCZH';

// class Videocalling extends StatefulWidget {
//   @override
//   State<Videocalling> createState() => _VideocallingState();
// }

// class _VideocallingState extends State<Videocalling> {
//   int? _remoteUid;
//   late RtcEngine _engine;

//   @override
//   void initState() {
//     super.initState();
//     initAgora();
//   }

//   Future<void> initAgora() async {
//     // retrieve permissions
//     await [Permission.microphone, Permission.camera].request();

//     //create the engine
//     _engine = await RtcEngine.create("eea35a29e63640c58179685ee868a8d5");
//     await _engine.enableVideo();
//     _engine.setEventHandler(
//       RtcEngineEventHandler(
//         joinChannelSuccess: (String channel, int uid, int elapsed) {
//           print("local user $uid joined");
//         },
//         userJoined: (int uid, int elapsed) {
//           print("remote user $uid joined");
//           setState(() {
//             _remoteUid = uid;
//           });
//         },
//         userOffline: (int uid, UserOfflineReason reason) {
//           print("remote user $uid left channel");
//           setState(() {
//             _remoteUid = null;
//           });
//         },
//       ),
//     );

//     await _engine.joinChannel(null, "firstchannel", null, 0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Agora Video Call'),
//       ),
//       body: Stack(
//         children: [
//           Center(
//             child: _remoteVideo(),
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: Container(
//               width: 100,
//               height: 100,
//               child: const Center(
//                 child: RtcLocalView.SurfaceView(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//     Widget _remoteVideo() {
//     if (_remoteUid != null) {
//       return RtcRemoteView.SurfaceView(uid: _remoteUid!, channelId: token,);
//     } else {
//       return const Text(
//         'Please wait for remote user to join',
//         textAlign: TextAlign.center,
//       );
//     }
//   }
// }
