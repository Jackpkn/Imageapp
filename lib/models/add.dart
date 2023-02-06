// import 'dart:io';

// import 'package:firebaseapp/authontication/login_page.dart';
// import 'package:flutter/material.dart';

// class AdHelper {
//  static String homePageBannner() {
//     if (Platform.isAndroid) {
//       return 'ca-app-pub-4547919744610614/1469371712';
//     } else {
//       return '';
//     }
//   }

//  static   String detailsPageBanner() {
//     if (Platform.isAndroid) {
//       return 'ca-app-pub-4547919744610614/5140969512';
//     } else {
//       return '';
//     }
//   }
//     // ignore: non_constant_identifier_names
//   static  String fullPageAd() {
//     if (Platform.isAndroid) {
//       return 'ca-app-pub-4547919744610614/9555142658';
//     } else {
//       return '';
//     }
//   }
// }

import 'dart:io';

class AdHelper {
  static String homePageBanner() {
    Platform.isAndroid
        ? 'ca-app-pub-4547919744610614/1469371712'
        : 'ca-app-pub-4547919744610614/1469371712';
    if (Platform.isAndroid) {
      return "ca-app-pub-4547919744610614/1469371712";
    } else {
      return "";
    }
  }

  static String detailsPageBanner() {
    if (Platform.isAndroid) {
      return "ca-app-pub-4547919744610614/5140969512";
    } else {
      return "";
    }
  }

  static String fullPageAd() {
    if (Platform.isAndroid) {
      return "ca-app-pub-4547919744610614/9555142658";
    } else {
      return "";
    }
  }
}
