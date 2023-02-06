// import 'dart:async';

 
// import 'package:firebaseapp/models/adnext.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_native_admob/flutter_native_admob.dart';
// // import 'package:flutter_native_admob/native_admob_controller.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late BannerAd _bannerAd;
//   late InterstitialAd _interstitialAd;
//   static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo();
//   int _coins = 0;
//   // final _nativeAdController = NativeAdmobController();
//   InterstitialAd createInterstitialAd() {
//     return InterstitialAd(
//         targetingInfo: targetingInfo,
//         adUnitId: InterstitialAd.testAdUnitId,
//         listener: (MobileAdEvent event) {
//           print('interstitial event: $event');
//         });
//   }

//   BannerAd createBannerAdd() {
//     return BannerAd(
//         targetingInfo: targetingInfo,
//         adUnitId: BannerAd.testAdUnitId,
//         size: AdSize.smartBanner,
//         listener: (MobileAdEvent event) {
//           print('Bnner Event: $event');
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Timer(Duration(seconds: 10), () {
//       _bannerAd.show();
//     });
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//         actions: [
//           IconButton(
//               icon: Icon(Icons.add),
//               onPressed: () {
//                 _bannerAd.dispose();
//                 // ignore: unnecessary_null_comparison
//                 // _bannerAd = null;
//                 _interstitialAd.show();
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => New()));
//               }),
//         ],
//       ),
//       body: Container(),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     FirebaseAdMob.instance
//         .initialize(appId: 'ca-app-pub-4547919744610614~8625204366');
//     _bannerAd = createBannerAdd()..load();
//     _interstitialAd = createInterstitialAd()..load();
//     // RewardedVideoAd.instance.load(
//     //     adUnitId: RewardedVideoAd.testAdUnitId, targetingInfo: targetingInfo);
//     // RewardedVideoAd.instance.listener =
//     //     (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
//     //   print('Rewarded event: $event');
//     //   if (event == RewardedVideoAdEvent.rewarded) {
//     //     setState(() {
//     //       _coins += rewardAmount;
//     //     });
//     //   }
//     // };
//   }

//   @override
//   void dispose() {
//     _bannerAd.dispose();
//     _interstitialAd.dispose();
//     super.dispose();
//   }
// }
