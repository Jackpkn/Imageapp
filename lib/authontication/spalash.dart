import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

import 'login_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 6000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green, Colors.teal, Colors.blueGrey],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: Center(
          widthFactor: 40,
          child: Image.asset("assets/wel.jpeg"),
        ),
      ),
    );
  }
}

class loop extends StatefulWidget {
  @override
  State<loop> createState() => _loopState();
}

class _loopState extends State<loop> {
  late AnimationController _lottieAnimation;
  var expanded = false;
  double _bigFontSize = kIsWeb ? 234 : 178;
  final transitionDuration = Duration(seconds: 1);
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 6000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('#43CBFF'),
          // image: DecorationImage(
          //   fit: BoxFit.cover,
          //   image: AssetImage('assets/n16.jpg'),
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
//             LottieBuilder.network(
//               'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/N.json',
//               //'https://assets5.lottiefiles.com/packages/lf20_oqbuws8x.json',
//               // 'https://assets8.lottiefiles.com/packages/lf20_axdyavir.json',
// //' https://assets8.lottiefiles.com/packages/lf20_axdyavir.json',
//               //     'https://assets7.lottiefiles.com/packages/lf20_D2t3ozSoE5.json',
//               //https://assets10.lottiefiles.com/packages/lf20_uwos7l6e.json
//               onLoaded: (composition) {
//                 _lottieAnimation.duration = composition.duration;
//               },
//               frameRate: FrameRate.max,
//               repeat: false,
//               animate: false,
//               height: 120,
//               width: 200,
//               controller: _lottieAnimation,
//             ),
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
            AnimatedCrossFade(
              firstCurve: Curves.fastOutSlowIn,
              crossFadeState: !expanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: transitionDuration,
              firstChild: Container(),
              secondChild: _logoRemainder(),
              alignment: Alignment.centerLeft,
              sizeCurve: Curves.easeInOut,
            ),
          ],
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
}
