import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/authontication/login_page.dart';
import 'package:firebaseapp/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:quiver/async.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  late AnimationController _lottieAnimation;
  var expanded = false;
  double _bigFontSize = kIsWeb ? 234 : 178;
  final transitionDuration = const Duration(seconds: 1);
  bool isLoding = false;
  @override
  void initState() {
    _lottieAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    Future.delayed(const Duration(seconds: 2))
        .then((value) => setState(() => expanded = true))
        .then((value) => const Duration(seconds: 2))
        .then(
          (value) => Future.delayed(const Duration(seconds: 2)).then(
            (value) => _lottieAnimation.forward().then(
                  (value) => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const Mainpage(),
                      ),
                      (route) => false),
                ),
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Hero(
        tag:
            'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/N.json',
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  //begin: Alignment.centerLeft,
                  // end: Alignment.centerLeft,
                  begin: Alignment(0, 1),
                  end: Alignment(2.7, 0),
                  colors: [
                    Color.fromARGB(255, 7, 252, 227),
                    Color.fromARGB(255, 137, 1, 149),
                    // Color.fromARGB(255, 0, 123, 185),
                  ]),

              //color: HexColor('#43CBFF'),
              boxShadow: [
                BoxShadow(
                  color: Colors.purpleAccent,
                )
              ]),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // LottieBuilder.network(
                //   'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/N.json',
                //   //'https://assets5.lottiefiles.com/packages/lf20_oqbuws8x.json',
                //   // 'https://assets8.lottiefiles.com/packages/lf20_axdyavir.json',
                //   //' https://assets8.lottiefiles.com/packages/lf20_axdyavir.json',
                //   //     'https://assets7.lottiefiles.com/packages/lf20_D2t3ozSoE5.json',
                //   //https://assets10.lottiefiles.com/packages/lf20_uwos7l6e.json
                //   onLoaded: (composition) {
                //     _lottieAnimation.duration = composition.duration;
                //   },
                //   frameRate: FrameRate.max,
                //   repeat: false,
                //   animate: false,
                //   height: 120,
                //   width: 200,
                //   controller: _lottieAnimation,
                // ),
                // AnimatedDefaultTextStyle(
                //   duration: transitionDuration,
                //   curve: Curves.fastOutSlowIn,
                //   style: TextStyle(
                //     color: const Color(0xFF4e954e),
                //     fontSize: !expanded ? _bigFontSize : 50,
                //     fontFamily: 'Montserrat',
                //     fontWeight: FontWeight.w600,
                //   ),
                //   child: const Text(
                //     "WELCOME",
                //   ),
                // ),
                // AnimatedCrossFade(
                //   firstCurve: Curves.fastOutSlowIn,
                //   crossFadeState: !expanded
                //       ? CrossFadeState.showFirst
                //       : CrossFadeState.showSecond,
                //   duration: transitionDuration,
                //   firstChild: Container(),
                //   secondChild: _logoRemainder(),
                //   alignment: Alignment.centerLeft,
                //   sizeCurve: Curves.easeInOut,
                // ),
                // Lottie.network(
                //   'https://assets7.lottiefiles.com/packages/lf20_D2t3ozSoE5.json',
                //   height: 200.0,
                //   repeat: true,
                //   reverse: true,
                //   animate: true,
                // ),
                // SizedBox(
                //   height: 6,
                // ),
                // Lottie.network(
                //   'https://assets10.lottiefiles.com/packages/lf20_69HH48.json',
                //   height: 200.0,
                //   repeat: true,
                //   reverse: true,
                //   animate: true,
                // ),
                Container(
                  height: 165,
                  width: 165,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/ndp12.png'),
                      //  image: AssetImage('assets/np3.png'),
                    ),
                  ),
                  // child: CachedNetworkImage(
                  //     imageUrl: 'assets/N.jpg',
                  //     imageBuilder: ((context, imageProvider) => Container(
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             image: DecorationImage(
                  //               fit: BoxFit.cover,
                  //               image: imageProvider,
                  //             ),
                  //           ),
                  //         )),
                  //     placeholder: ((context, url) => Center(
                  //           child: LoadingAnimationWidget.threeArchedCircle(
                  //               color: Colors.cyan, size: 40),
                  //         )),
                  //     errorWidget: (context, url, error) => const Center(
                  //           child: Text('Some error Occurred'),
                  //         )),
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedDefaultTextStyle(
                  style: const TextStyle(color: Colors.amber, fontSize: 50),
                  duration: transitionDuration,
                  // curve: Curves.fastOutSlowIn,
                  // style: TextStyle(
                  //   color: const Color(0xFF4e954e),
                  //   fontSize: !expanded ? _bigFontSize : 50,
                  //   fontFamily: 'Montserrat',
                  //   fontWeight: FontWeight.w600,
                  // ),
                  child: Text(
                    "WELLCOME",
                    style: GoogleFonts.sansita(
                      decorationColor: Colors.amber,
                      // color: Colors.black,
                      foreground: Paint(),
                      //background: Paint()
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoRemainder() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
//         LottieBuilder.network(
//           'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/N.json',
//           //'https://assets5.lottiefiles.com/packages/lf20_oqbuws8x.json',
//           // 'https://assets8.lottiefiles.com/packages/lf20_axdyavir.json',
// //' https://assets8.lottiefiles.com/packages/lf20_axdyavir.json',
//           //     'https://assets7.lottiefiles.com/packages/lf20_D2t3ozSoE5.json',
//           //https://assets10.lottiefiles.com/packages/lf20_uwos7l6e.json
//           onLoaded: (composition) {
//             _lottieAnimation.duration = composition.duration;
//           },
//           frameRate: FrameRate.max,
//           repeat: false,
//           animate: false,
//           height: 120,
//           width: 200,
//           controller: _lottieAnimation,
//         ),
        // const Text(
        //   'ND',
        //   style: TextStyle(
        //     color: Color(0xFF4e954e),
        //     fontSize: 50,
        //     // fontFamily: 'Montserrat',
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
        LottieBuilder.network(
          // 'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/N.json',
          //'https://assets5.lottiefiles.com/packages/lf20_oqbuws8x.json',
          // 'https://assets8.lottiefiles.com/packages/lf20_axdyavir.json',
          //' https://assets8.lottiefiles.com/packages/lf20_axdyavir.json',
          'https://assets7.lottiefiles.com/packages/lf20_D2t3ozSoE5.json',
          //https://assets10.lottiefiles.com/packages/lf20_uwos7l6e.json
          onLoaded: (composition) {
            _lottieAnimation.duration = composition.duration;
          },
          frameRate: FrameRate.max,
          repeat: false,
          animate: false,
          height: 120,
          width: 200,
          controller: _lottieAnimation,
        ),
        AnimatedDefaultTextStyle(
          duration: transitionDuration,
          curve: Curves.fastOutSlowIn,
          style: TextStyle(
            color: const Color(0xFF4e954e),
            fontSize: !expanded ? _bigFontSize : 50,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            "WELLCOME",
            style: GoogleFonts.fugazOne(
              color: Colors.amber,
            ),
          ),
        ),
        // LottieBuilder.asset(
        //   'assets/n15.jpg',
        //   onLoaded: (composition) {
        //     _lottieAnimation.duration = composition.duration;
        //   },
        //   frameRate: FrameRate.max,
        //   repeat: false,
        //   animate: false,
        //   height: 10,
        //   width: 10,
        //   controller: _lottieAnimation,
        // )
      ],
    );
  }
  //
  // Widget _logoAbbreviated() {
  //   return Container(
  //     // color: Colors.blue,
  //     height: 150,
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [],
  //     ),
  //   );
  // }
  //
  // Widget _logoExtended() {
  //   return Container(
  //     height: 150,
  //     child: Row(
  //       // mainAxisSize: MainAxisSize.min,
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         Expanded(
  //           child: Text(
  //             "HOWTIME",
  //             // textAlign: TextAlign.center,
  //             maxLines: 1,
  //             style: Theme.of(context).textTheme.headline3!.merge(GoogleFonts.montserrat()),
  //           ),
  //         ),
  //         LottieBuilder.asset(
  //           'assets/food.json',
  //           onLoaded: (composition) {
  //             _lottieAnimation..duration = composition.duration;
  //           },
  //           frameRate: FrameRate.max,
  //           repeat: false,
  //           animate: false,
  //           height: 100,
  //           width: 100,
  //           controller: _lottieAnimation,
  //         )
  //       ],
  //     ),
  //   );
  // }
}
