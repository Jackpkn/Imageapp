
import 'package:firebaseapp/json/homejson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/DurationRange.dart';
import 'package:flutter_meedu_videoplayer/bar.dart';
import 'package:flutter_meedu_videoplayer/forward_and_rewind.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:wakelock/wakelock.dart';

// class PlayMoviePage extends StatefulWidget {
//   @override
//   _PlayMoviePageState createState() => _PlayMoviePageState();
// }

// class _PlayMoviePageState extends State<PlayMoviePage> {
//   final MeeduPlayerController _meeduPlayerController =
//       MeeduPlayerController(colorTheme: Colors.green);

//   int count = 0;

//   @override
//   void initState() {
//     super.initState();
//     // The following line will enable the Android and iOs wakelock
//     Wakelock.enable();
//     _init();
//   }

//   _init() async {
//     // launch the player in fullscreen mode
//     await _meeduPlayerController.launchAsFullscreen(
//       context,
//       dataSource:
//           DataSource(type: DataSourceType.network, source: 'assets/live.mp4'),
//       autoplay: false,
//       header: header,
//     );
//   }

//   Widget get header {
//     return Container(
//       margin: EdgeInsets.zero,
//       child: Row(
//         children: [
//           IconButton(
//               icon: const Icon(
//                 Icons.arrow_back_ios,
//                 color: Colors.amber,
//               ),
//               onPressed: () {
//                 // turn back
//                 Navigator.of(context).popUntil((route) => count++ >= 2);
//               }),
//           const Expanded(
//             child: Text(
//               'Jack',
//               style: TextStyle(color: Colors.amber),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

 

class PlayBackSpeedExamplePage extends StatefulWidget {
  const PlayBackSpeedExamplePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PlayBackSpeedExamplePageState createState() =>
      _PlayBackSpeedExamplePageState();
}

class _PlayBackSpeedExamplePageState extends State<PlayBackSpeedExamplePage> {
  final _controller = MeeduPlayerController(
    screenManager: const ScreenManager(
      forceLandScapeInFullscreen: false,
    ),
  );

  final ValueNotifier<double> _playbackSpeed = ValueNotifier(1);

  void _onPlaybackSpeed() {
    final options = [0.2, 0.5, 1.0, 2.0, 4.0];
    showCupertinoModalPopup(
      context: context,
      builder: (_) => CupertinoActionSheet(
        actions: List.generate(
          options.length,
          (index) => CupertinoActionSheetAction(
            child: Text("${options[index]}x"),
            onPressed: () {
              _playbackSpeed.value = options[index];
              // change the playback speed
              _controller.setPlaybackSpeed(
                _playbackSpeed.value,
              );
              // hide the modal
              Navigator.pop(_);
            },
          ),
        ),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(_),
          isDestructiveAction: true,
          child: const Text("Cancel"),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  int index = 0;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _init() {
    _controller.setDataSource(
      DataSource(
        type: DataSourceType.network,
        source:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
      autoplay: true,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: MeeduVideoPlayer(
          controller: _controller,
          bottomRight: (ctx, controller, responsive) {
            // creates a responsive fontSize using the size of video container
            final double fontSize = responsive.ip(3);

            return CupertinoButton(
              padding: const EdgeInsets.all(5),
              minSize: 25,
              onPressed: _onPlaybackSpeed,
              child: ValueListenableBuilder<double>(
                valueListenable: this._playbackSpeed,
                builder: (context, double speed, child) {
                  return Text(
                    "$speed x",
                    style: TextStyle(
                      fontSize: fontSize > 18 ? 18 : fontSize,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
