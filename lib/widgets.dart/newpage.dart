//  import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebaseapp/video/video.dart';
// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   File? file;
//   String? name;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: MaterialButton(
//           color: Colors.indigo[900],
//           onPressed: () async {
//             await getfile();
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Home1(sub1: file!),
//               ),
//             );
//           },
//           child: Text(
//             'pick video',
//             style: TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   getfile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['mp3', 'mp4'],
//     );

//     if (result != null) {
//       File c = File(result.files.single.path.toString());
//       setState(() {
//         file = c;
//         name = result.names.toString();
//       });
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/im1.png')
      // network(
      //   'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      // )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
