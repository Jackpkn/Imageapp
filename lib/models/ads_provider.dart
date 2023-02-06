// // import 'dart:core';
// // import 'dart:developer';

// // import 'package:firebaseapp/authontication/spalash.dart';
// // import 'package:firebaseapp/models/add.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:google_mobile_ads/google_mobile_ads.dart';

// // class AdProvider with ChangeNotifier {
// //   bool isHomePage = false;
// //   late BannerAd homePageBanner;
// //   bool isLoginsce = false;
// //   late BannerAd loginsc;
// //   bool isDetails = false;
// //   late InterstitialAd detailPagebanner;
// //   void initialHomePageBanner() async {
// //     homePageBanner = BannerAd(
// //         size: AdSize.banner,
// //         adUnitId: Adhelper.homePageBannner(),
// //         listener: BannerAdListener(
// //           onAdLoaded: (ad) {
// //             log('HomePage Banner Loaded!');
// //             isHomePage = true;
// //           },
// //           onAdClosed: (ad) {
// //             ad.dispose();
// //             isHomePage = false;
// //           },
// //           onAdFailedToLoad: (ad, error) {
// //             log(error.toString());
// //             isHomePage = false;
// //           },
// //         ),
// //         request: const AdRequest());
// //     await homePageBanner.load();
// //     notifyListeners();
// //   }

// //   void loginscr() async {
// //     homePageBanner = BannerAd(
// //         size: AdSize.banner,
// //         adUnitId: Adhelper.homePageBannner(),
// //         listener: BannerAdListener(
// //           onAdLoaded: (ad) {
// //             log('HomePage Banner Loaded!');
// //             isHomePage = true;
// //           },
// //           onAdClosed: (ad) {
// //             ad.dispose();
// //             isHomePage = false;
// //           },
// //           onAdFailedToLoad: (ad, error) {
// //             log(error.toString());
// //             isHomePage = false;
// //           },
// //         ),
// //         request: const AdRequest());
// //     await homePageBanner.load();
// //     notifyListeners();
// //   }

// //   // ignore: non_constant_identifier_names
// //   void DetailPageBanner() async {
// //     await InterstitialAd.load(
// //         adUnitId: Adhelper.DetailsPageBanner(),
// //         request: const AdRequest(),
// //         adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
// //           log('Full  Page Ad Loaded!');
// //         }, onAdFailedToLoad: (err) {
// //           log(err.toString());
// //           isDetails = false;
// //         }));
// //     notifyListeners();
// //   }
// // }

// import 'dart:developer';

// import 'package:firebaseapp/models/add.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AdProvider with ChangeNotifier {

//   bool isHomePageBannerLoaded = false;
//   late BannerAd homePageBanner;

//   bool isDetailsPageBannerLoaded = false;
//   late BannerAd detailsPageBanner;

//   bool isFullPageAdLoaded = false;
//   late InterstitialAd fullPageAd;

//   void initializeHomePageBanner() async {
//     homePageBanner = BannerAd(
//       adUnitId: AdHelper.homePageBanner(),
//       size: AdSize.banner,
//       request: AdRequest(),
//       listener: BannerAdListener(
//         onAdLoaded: (ad) {
//           log("HomePage Banner Loaded!");
//           isHomePageBannerLoaded = true;
//         },
//         onAdClosed: (ad) {
//           ad.dispose();
//           isHomePageBannerLoaded = false;
//         },
//         onAdFailedToLoad: (ad, err) {
//           log(err.toString());
//           isHomePageBannerLoaded = false;
//         }
//       ),
//     );

//     await homePageBanner.load();
//     notifyListeners();
//   }

//   void initializeDetailsPageBanner() async {
//     detailsPageBanner = BannerAd(
//       adUnitId: AdHelper.detailsPageBanner(),
//       size: AdSize.banner,
//       request: AdRequest(),
//       listener: BannerAdListener(
//         onAdLoaded: (ad) {
//           log("Details Banner Loaded!");
//           isDetailsPageBannerLoaded = true;
//         },
//         onAdClosed: (ad) {
//           ad.dispose();
//           isDetailsPageBannerLoaded = false;
//         },
//         onAdFailedToLoad: (ad, err) {
//           log(err.toString());
//           isDetailsPageBannerLoaded = false;
//         }
//       ),
//     );

//     await detailsPageBanner.load();
//     notifyListeners();
//   }

//   void initializeFullPageAd() async {
//     await InterstitialAd.load(
//       adUnitId: AdHelper.fullPageAd(),
//       request: AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (ad) {
//           log("Full Page Ad Loaded!");
//           fullPageAd = ad;
//           isFullPageAdLoaded = true;
//         },
//         onAdFailedToLoad: (err) {
//           log(err.toString());
//           isFullPageAdLoaded = false;
//         }
//       ),
//     );

//     notifyListeners();
//   }

// }

import 'package:firebaseapp/models/adnext.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ShowAds extends StatefulWidget {
  @override
  State<ShowAds> createState() => _ShowAdsState();
}

class _ShowAdsState extends State<ShowAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
          key: UniqueKey(),
        ),
      ),
    );
  }
}
