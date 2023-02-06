// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:audioplayers/audioplayers.dart';

// class MusicPlayer extends StatefulWidget {
//   @override
//   State<MusicPlayer> createState() => _MusicPlayerState();
// }

// class _MusicPlayerState extends State<MusicPlayer> {
//   String img_cover_url =
//       "https://i.pinimg.com/736x/a7/a9/cb/a7a9cbcefc58f5b677d8c480cf4ddc5d.jpg";

//   bool isPlaying = false;
//   double value = 0;
//   final player = AudioPlayer();
//   Duration? duration;

//   void initPlayer() async {
//     await player.setSource(AssetSource("music.mp3"));
//     duration = await player.getDuration();
//   }

//   //init the player
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initPlayer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             constraints: const BoxConstraints.expand(),
//             height: 300.0,
//             width: 300.0,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/cover.jpg"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
//               child: Container(
//                 color: Colors.black.withOpacity(0.6),
//               ),
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               //setting the music cover
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(30.0),
//                 child: Image.asset(
//                   "assets/am.jpg",
//                   width: 250.0,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               const Text(
//                 "Summer",
//                 style: TextStyle(
//                     color: Colors.white, fontSize: 36, letterSpacing: 6),
//               ),
//               //Setting the seekbar
//               const SizedBox(
//                 height: 50.0,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "${(value / 60).floor()}: ${(value % 60).floor()}",
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                   Container(
//                     width: 260.0,
//                     child: Slider.adaptive(
//                       onChangeEnd: (new_value) async {
//                         setState(() {
//                           value = new_value;
//                           print(new_value);
//                         });
//                         await player.seek(Duration(seconds: new_value.toInt()));
//                       },
//                       min: 0.0,
//                       value: value,
//                       max: 214.0,
//                       onChanged: (value) {},
//                       activeColor: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     // "${duration.inMinutes} : ${duration!.inSeconds % 60}",
//                     "${duration?.inMinutes} : ${duration!.inSeconds % 60}",
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 ],
//               ),
//               //setting the player controller
//               const SizedBox(
//                 height: 60.0,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(60.0),
//                       color: Colors.black87,
//                       border: Border.all(color: Colors.white38),
//                     ),
//                     width: 50.0,
//                     height: 50.0,
//                     child: InkWell(
//                       onTapDown: (details) {
//                         player.setPlaybackRate(0.5);
//                       },
//                       onTapUp: (details) {
//                         player.setPlaybackRate(1);
//                       },
//                       child: const Center(
//                         child: Icon(
//                           Icons.fast_rewind_rounded,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 20.0),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(60.0),
//                       color: Colors.black87,
//                       border: Border.all(color: Colors.pink),
//                     ),
//                     width: 60.0,
//                     height: 60.0,
//                     child: InkWell(
//                       onTap: () async {
//                         //setting the play function
//                         await player.resume();
//                         player.onPositionChanged.listen(
//                           (Duration d) {
//                             setState(() {
//                               value = d.inSeconds.toDouble();

//                               print(value);
//                             });
//                           },
//                         );
//                         print(duration);
//                       },
//                       child: const Center(
//                         child: Icon(
//                           Icons.play_arrow,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(60.0),
//                       color: Colors.black87,
//                       border: Border.all(color: Colors.white38),
//                     ),
//                     width: 50.0,
//                     height: 50.0,
//                     child: InkWell(
//                       onTapDown: (details) {
//                         player.setPlaybackRate(2);
//                       },
//                       onTapUp: (details) {
//                         player.setPlaybackRate(1);
//                       },
//                       child: const Center(
//                         child: Icon(
//                           Icons.fast_forward_rounded,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';


class Glass extends StatefulWidget {
  @override
  State<Glass> createState() => _GlassState();
}

class _GlassState extends State<Glass> {
  @override
  Widget build(BuildContext context) {
    return GlassContainer.clearGlass(
        height: 200, width: 300, child: Text('jack'));
    // GlassContainer(
    //   height: 300,
    //   width: 400,
    //   color: Colors.grey,
    //   // gradient: LinearGradient(
    //   //   colors: [Colors.white.withOpacity(0.40), Colors.white.withOpacity(0.10)],
    //   //   begin: Alignment.topLeft,
    //   //   end: Alignment.bottomRight,
    //   // ),
    //   borderGradient: LinearGradient(
    //     colors: [
    //       Colors.white.withOpacity(0.60),
    //       Colors.white.withOpacity(0.10),
    //       Colors.lightBlueAccent.withOpacity(0.05),
    //       Colors.lightBlueAccent.withOpacity(0.6)
    //     ],
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //     stops: [0.0, 0.39, 0.40, 1.0],
    //   ),
    //   blur: 15.0,
    //   borderWidth: 1.5,
    //   elevation: 3.0,
    //   isFrostedGlass: true,
    //   shadowColor: Colors.black.withOpacity(0.20),
    //   alignment: Alignment.center,
    //   frostedOpacity: 0.12,
    //   margin: EdgeInsets.all(8.0),
    //   padding: EdgeInsets.all(8.0),
    // );
  }
}
