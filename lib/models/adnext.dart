import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

//ca-app-pub-3940256099942544/6300978111
class AdmobHelper {
  static String get bannerID => Platform.isAndroid
      ? 'ca-app-pub-4547919744610614/9615584920'
      : 'ca-app-pub-4547919744610614/9615584920';

  static initialize() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd getBannerAd() {
    BannerAd bAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: bannerID,
        listener: BannerAdListener(onAdClosed: (Ad ad) {
          print("Ad Closed");
        }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        }, onAdLoaded: (Ad ad) {
          print('Ad Loaded');
        }, onAdOpened: (Ad ad) {
          print('Ad opened');
        }),
        request: AdRequest());

    return bAd;
  }
}
