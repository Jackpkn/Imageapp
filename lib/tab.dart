import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/nav/google.dart';
import 'package:firebaseapp/nav/homenav.dart';
import 'package:firebaseapp/nav/instagram.dart';
import 'package:firebaseapp/nav/spotify.dart';
// import 'package:firebaseapp/nav/hotstar.dart';
import 'package:firebaseapp/nav/youtube.dart';
import 'package:firebaseapp/users/homescreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebaseapp/nav/google.dart';
import 'package:firebaseapp/nav/homenav.dart';
import 'package:firebaseapp/nav/instagram.dart';
import 'package:firebaseapp/nav/youtube.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/single_child_widget.dart';

class MyTabs extends StatefulWidget {
  //const MyTabs({Key? key}) : super(key: key);

  @override
  State<MyTabs> createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  bool visible = true;
  late TabController tabController;
  ScrollController _scrollController = ScrollController();
  late var currentIndex = 0;
  late bool isLoading = false;
  bool showBtmAppBr = false;
  @override
  void initState() {
    super.initState();

    //tabController = TabController(length: 4, vsync: this);
    tabController = TabController(
        length: 4, animationDuration: const Duration(microseconds: 30), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: LoadingAnimationWidget.threeArchedCircle(
              // leftDotColor: Colors.black,
              // rightDotColor: Colors.red,
              color: Colors.green,
              size: 60,
            ),
          )
        : Scaffold(
            bottomNavigationBar: AnimatedContainer(
              //color: HexColor('#AE8625'),

              decoration: const BoxDecoration(color: Colors.black
                  //borderRadius: BorderRadius.all(Radius.circular(10)),
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Colors.blue,
                  //     Color.fromARGB(255, 233, 169, 221),
                  //     Colors.cyanAccent,
                  //   ],
                  // ),
                  ),
              duration: const Duration(milliseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn,
              height: visible ? kBottomNavigationBarHeight : 0,
              // height: 45,
              child: TabBar(
                onTap: (value) {
                  currentIndex = value;
                  setState(() {
                    currentIndex = value;
                  });
                },

                unselectedLabelColor: Colors.white,
                labelColor: Colors.red,
                labelStyle: const TextStyle(fontSize: 12),
                controller: tabController,
                //controller: tabController,
                tabs: const [
                  Tab(
                    icon: Icon(
                      FontAwesomeIcons.home,
                      color: Colors.white,
                    ),
                    text: 'Home',
                  ),
                  Tab(
                    icon: Icon(
                      FontAwesomeIcons.youtube,
                      color: Colors.white,
                    ),
                    text: 'Youtube',
                  ),
                  Tab(
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    text: 'Google',
                  ),
                  Tab(
                    icon: Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                    ),
                    text: 'Instagram',
                  ),
                  // Tab(
                  //   icon: Icon(FontAwesomeIcons.snapchat),
                  //   text: 'Snapchat',
                  // ),
                ],
              ),
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              dragStartBehavior: DragStartBehavior.down,
              controller: tabController,
              children: [
                //HomeButton(),
                HomeScreen(
                    // hideNavigation: hideNav,
                    // showNavigation: showNav,
                    ),
                // WhatSapp(),
                YoutubeScreen(),
                const GoogleScreen(),
                const instaScreen(),
                // SnapchatScreen(),
              ],
            ),
          );
  }

  void hideNav() {
    setState(() {
      visible = false;
    });
  }

  void showNav() {
    setState(() {
      visible = true;
    });
  }
}
/*


*/

// class HomeScreen extends StatefulWidget {
//   final VoidCallback showNavigation;
//   final VoidCallback hideNavigation;

//   const HomeScreen(
//       {Key? key, required this.showNavigation, required this.hideNavigation})
//       : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   ScrollController scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();

//     scrollController.addListener(() {
//       if (scrollController.position.userScrollDirection ==
//           ScrollDirection.forward) {
//         widget.showNavigation();
//       } else {
//         widget.hideNavigation();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();

//     scrollController.removeListener(() {
//       if (scrollController.position.userScrollDirection ==
//           ScrollDirection.forward) {
//         widget.showNavigation();
//       } else {
//         widget.hideNavigation();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView(
//         controller: scrollController,
//         children: [
//           Container(
//             color: Colors.red,
//             height: 270,
//           ),
//           Container(
//             color: Colors.blue,
//             height: 200,
//           ),
//           Container(
//             color: Colors.purple,
//             height: 200,
//           ),
//           Container(
//             color: Colors.green,
//             height: 280,
//           ),
//         ],
//       ),
//     );
//   }
// }
