// ignore_for_file: avoid_unnecessary_containers

import 'dart:convert';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';

import 'package:firebaseapp/jsonfo/jsonfile.dart';
import 'package:firebaseapp/nav/gana.dart';
import 'package:firebaseapp/widdg/loading.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

// import 'package:firebaseapp/nav/hotstar.dart';

import 'package:firebaseapp/drawer/drawer.dart';

import 'package:firebaseapp/widgets.dart/Qutos.dart';

import 'package:flutter/material.dart';
import 'package:flutter_glass/flutter_glass.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../wallss/servies/fullscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // final VoidCallback showNavigation;
  // final VoidCallback hideNavigation;

  // const HomeScreen(
  //     {Key? key, required this.showNavigation, required this.hideNavigation})
  //     : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // ignore: non_constant_identifier_names
  late List Images = [];
  bool isLoding = false;
  int page = 1;
  List images = [];
  bool loading = false;
  ScrollController scrollController = ScrollController();
  @override
  // void initState() {

  //   super.initState();
  // }

  @override
  void initState() {
    fetchapi();

    super.initState();

    // scrollController.addListener(() {
    //   if (scrollController.position.userScrollDirection ==
    //       ScrollDirection.forward) {
    //     widget.showNavigation();
    //   } else {
    //     widget.hideNavigation();
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();

    // scrollController.removeListener(() {
    //   if (scrollController.position.userScrollDirection ==
    //       ScrollDirection.forward) {
    //     widget.showNavigation();
    //   } else {
    //     widget.hideNavigation();
    //   }
    // });
  }

  final Controller = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color.fromARGB(255, 7, 7, 7),
        appBar: AppBar(
          flexibleSpace: Container(
            height: 60,
            // color: HexColor('#AE8625'),
            decoration: const BoxDecoration(color: Colors.black
                // gradient: LinearGradient(
                //   colors: [
                //     Colors.blue,
                //     Color.fromARGB(255, 233, 169, 221),
                //     Colors.cyanAccent,
                //   ],
                // ),
                ),
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "WELLCOME",
                style: GoogleFonts.dancingScript(
                  color: Colors.white,
                  fontSize: 21,
                  textStyle: const TextStyle(
                    // color: Colors.green,
                    color: Color.fromARGB(255, 3, 39, 239),
                    //fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Hotstar(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 215, 1, 1),
                        Colors.blue,
                        Color.fromARGB(255, 90, 255, 7),
                        Color.fromARGB(255, 244, 7, 220),
                      ],
                    ),
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   // colors: [
                    //   //   Colors.amber,
                    //   //   // Color.fromARGB(255, 66, 155, 34),
                    //   //   // Color(0xFFEEA863)
                    //   // ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      // onTap: (() {
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (context) => Hotstar()));
                      // }),
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                          image: const DecorationImage(
                            image: AssetImage('assets/hotstar.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // child: Container(
              //   height: 45,
              //   width: 45,
              //   decoration: const BoxDecoration(
              //       // shape: BoxShape.circle,
              //       borderRadius: BorderRadius.all(Radius.circular(500)),
              //       image: DecorationImage(
              //           image: AssetImage('assets/hotstar.jpeg'))),
              // ),
            ),
          ],
          centerTitle: true,
        ),
        drawer: const Drawer(
          backgroundColor: Colors.tealAccent,
          child: AppDrawer(),
        ),
        body: Jalc(
            // hideNavigation: widget.hideNavigation,
            // showNavigation: widget.showNavigation,
            ),
      ),
    );
  }

  fetchapi() async {
    isLoding = true;
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers: {
          'Authorization':
              '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96'
        }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      isLoding = false;
    });
  }
}

class Jalc extends StatefulWidget {
  // final VoidCallback showNavigation;
  // final VoidCallback hideNavigation;

  // const Jalc(
  //     {Key? key, required this.showNavigation, required this.hideNavigation})
  //     : super(key: key);

  @override
  State<Jalc> createState() => _JalcState();
}

class _JalcState extends State<Jalc> with SingleTickerProviderStateMixin {
  //late List Images = [];
  bool isLoding = false;
  int page = 1;
  //this is to show app bar
  ScrollController _scrollBottomBarController =
      ScrollController(); // set controller on scrolling
  bool isScrollingDown = false;
  double bottomBarHeight = 75; // set bottom bar height

  List images = [];

  late bool isLoading = false;
  // @override
  // void initState() {
  //   super.initState();

  // }

  ScrollController scrollController = ScrollController();
  ScrollController _scrollController = ScrollController();
  @override
  // void initState() {

  //   super.initState();
  // }
  late TabController _tabController;
  bool showBtmAppBr = true;
  bool sendme = false;
  bool connected = false;
  int amalreadyconnected = 0;

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
    _scrollBottomBarController.removeListener(() {});
    super.dispose();
  }

  bool hideui = false;
  @override
  void initState() {
    _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        setState(() {
          hideui = true;
        });
      } else {
        setState(() {
          hideui = false;
        });
      }
    });
    fetchapi();
    peacock();
    abstact();
    motivation();
    technolgy();
    winter();
    // fetchapi();
    // _scrollController.addListener(() {
    //   if (_scrollController.position.userScrollDirection ==
    //       ScrollDirection.reverse) {
    //     showBtmAppBr = false;
    //     setState(() {});
    //   } else {
    //     showBtmAppBr = true;
    //     setState(() {});
    //   }
    // });

    super.initState();

    // scrollController.addListener(() {
    //   if (scrollController.position.userScrollDirection ==
    //       ScrollDirection.forward) {
    //     widget.showNavigation();
    //   } else {
    //     widget.hideNavigation();
    //   }
    // });
  }

  // @override
  // void dispose() {

  //   // scrollController.removeListener(() {
  //   //   if (scrollController.position.userScrollDirection ==
  //   //       ScrollDirection.forward) {
  //   //     widget.showNavigation();
  //   //   } else {
  //   //     widget.hideNavigation();
  //   //   }
  //   // });
  // }

  void showBottomBar() {
    setState(() {});
  }

  void hideBottomBar() {
    setState(() {});
  }

  // void myScroll() async {
  //   _scrollBottomBarController.addListener(() {
  //     if (_scrollBottomBarController.position.userScrollDirection ==
  //         ScrollDirection.reverse) {
  //       if (!isScrollingDown) {
  //         isScrollingDown = true;
  //         _showAppbar = false;
  //         hideBottomBar();
  //       }
  //     }
  //     if (_scrollBottomBarController.position.userScrollDirection ==
  //         ScrollDirection.forward) {
  //       if (isScrollingDown) {
  //         isScrollingDown = false;
  //         _showAppbar = true;
  //         showBottomBar();
  //       }
  //     }
  //   });
  // }
  late List motv = [];
  late List flowrs = [];
  motivation() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url =
        'https://api.pexels.com/v1/search?query=motivation&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        motv = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  peacock() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=coding&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96',
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        flowrs = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  List photos = [];
  List tech = [];
  abstact() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=lotus&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96',
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        photos = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  technolgy() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=animals&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96',
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        tech = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  List win = [];
  winter() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url =
        'https://api.pexels.com/v1/search?query=technology&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96',
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        win = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  final Connectivity _connectivity = Connectivity();
  final Controller = PageController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      // physics: const ClampingScrollPhysics(),
      physics: const BouncingScrollPhysics(),
      // physics: const NeverScrollableScrollPhysics(),
      // physics: ScrollPhysics(parent: ),
      controller: _scrollController,
      // controller: _scrollBottomBarController,
      children: [
        // AmazonSc(url: 'https://www.amazon.in'),
        // ElevatedButton(
        //     onPressed: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => Imagesaver()));
        //       // String url =
        //       //     'https://occ-0-1001-999.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABd0nma8uLnnX-XCHERJ8V1Yn6PE44b1i8NOap3-4Xe7-bPAAJV6IREMBbBADEK0vflh7lPBnWi2iYsEPaN9UZgjZvqQh.jpg?r=cc1';
        //       // final tempDir = await getTemporaryDirectory();
        //       // final path = '${tempDir.path}/myfile.jpg';

        //       // await Dio().download(url, path);
        //       // await GallerySaver.saveImage(path);
        //     },
        //     child: Text('tAB')),
        const SizedBox(
          height: 6,
        ),
        // Story(),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: Boxses(),
        ),
        //const Frame(),
        const SizedBox(
          height: 8,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.6, vertical: 8),
          child: Container(
            height: 20,
            decoration: BoxDecoration(
                // gradient: const LinearGradient(
                //   colors: [
                //     Colors.blue,
                //     Colors.lime,
                //     Colors.teal,
                //   ],
                // ),
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)),
            child: const Text(
              'Amazing Pictures',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            viewportFraction: 0.93,
            autoPlay: false,
            autoPlayCurve: Curves.easeInOutCirc,
          ),
          items: List.generate(amazing.length, (index) {
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Scr(
                //       scree: scr[index].toString(),
                //     ),
                //   ),
                // );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => FullScreen(
                //       imageurl: motiv[index],
                //     ),
                //   ),
                // );
                Navigator.of(context).push(_fullscreen(index));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => FullScreen(imageurl: amazing[index])
                //       // ImageView(imgPath: amazing[index]),
                //       ),
                // );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 0),
                child: CachedNetworkImage(
                  imageUrl: amazing[index],
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: LoadingAnimationWidget.threeArchedCircle(
                      color: Colors.cyan,
                      size: 25,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.image_not_supported_rounded,
                    color: Colors.black,
                  ),
                ),
                //  Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     image: DecorationImage(
                //       onError: (error, stackTrace) =>
                //           const AssetImage('assets/n16.jpg'),
                //       fit: BoxFit.cover,
                //       image: NetworkImage(motiv[index]),
                //     ),
                //   ),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: Colors.black.withOpacity(0.2),
                //     ),
                //   ),
                // ),
              ),
            );
          }),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
        //   child: Container(
        //     height: 26,
        //     decoration: BoxDecoration(
        //         // gradient: const LinearGradient(
        //         //   colors: [
        //         //     Colors.blue,
        //         //     Colors.lime,
        //         //     Colors.teal,
        //         //   ],
        //         // ),
        //         color: Colors.black,
        //         borderRadius: BorderRadius.circular(10)),
        //     child: const Center(
        //       child: Text(
        //         'Good Morning',
        //         style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 19,
        //             fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //   ),
        // ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7.6, vertical: 8),
                  child: Container(
                    height: 26,
                    decoration: BoxDecoration(
                        // gradient: const LinearGradient(
                        //   colors: [
                        //     Colors.blue,
                        //     Colors.lime,
                        //     Colors.teal,
                        //   ],
                        // ),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Motivation Pictures',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                hideui
                    ? Center(
                        child: Column(
                          children: const [
                            Text('No Internet Connection'),
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => MusicPlayer(),
                          //   ),
                          // );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          // height: double.infinity,
                          height: 180,

                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 3.4,
                                );
                              },
                              // itemCount: motiv.length,
                              itemCount: motv.length,
                              // shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext ctx, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(_motivation(index));
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => FullScreen(
                                    //         imageUrl: motv[index]['src']
                                    //             ["large2x"]),
                                    //   ),
                                    // );
                                  },
                                  child: Container(
                                    height: 120,
                                    width: 130,

                                    decoration: BoxDecoration(
                                        // color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(10),
                                    //     image: DecorationImage(
                                    //         fit: BoxFit.cover,
                                    //         image: NetworkImage(galasy[index]),),),
                                    child: CachedNetworkImage(
                                      // imageUrl: motiv[index],
                                      imageUrl: motv[index]['src']["large2x"],
                                      imageBuilder: ((context, imageProvider) =>
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: imageProvider,
                                              ),
                                            ),
                                          )),
                                      placeholder: ((context, url) => Center(
                                            child: LoadingAnimationWidget
                                                .threeArchedCircle(
                                                    color: Colors.cyan,
                                                    size: 25),
                                          )),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.image_not_supported_rounded,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7.6, vertical: 7),
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                        // gradient: const LinearGradient(
                        //   colors: [
                        //     Colors.blue,
                        //     Colors.lime,
                        //     Colors.teal,
                        //   ],
                        // ),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Good Morning',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(
                //     //   context,
                //     //   MaterialPageRoute(
                //     //     builder: (context) => MusicPlayer(),
                //     //   ),
                //     // );
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 0),
                //     child: Container(
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10)),
                //       // height: double.infinity,
                //       height: 204,
                //       margin: const EdgeInsets.symmetric(horizontal: 7),
                //       child: ListView.separated(
                //           separatorBuilder: (context, index) {
                //             return const SizedBox(
                //               width: 12,
                //             );
                //           },
                //           itemCount: goodm.length,
                //           // shrinkWrap: true,
                //           scrollDirection: Axis.horizontal,
                //           itemBuilder: (BuildContext ctx, int index) {
                //             return GestureDetector(
                //               onTap: () {
                //                 Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                     builder: (context) =>
                //                         FullScreen(imageurl: goodm[index]),
                //                   ),
                //                 );
                //               },
                //               child: Container(
                //                 height: 126,
                //                 width: 130,

                //                 decoration: BoxDecoration(
                //                     // color: Colors.green,
                //                     borderRadius: BorderRadius.circular(10)),
                //                 // decoration: BoxDecoration(
                //                 //     borderRadius: BorderRadius.circular(10),
                //                 //     image: DecorationImage(
                //                 //         fit: BoxFit.cover,
                //                 //         image: NetworkImage(galasy[index]),),),
                //                 child: CachedNetworkImage(
                //                   imageUrl: goodm[index],
                //                   imageBuilder: ((context, imageProvider) =>
                //                       Container(
                //                         decoration: BoxDecoration(
                //                           borderRadius:
                //                               BorderRadius.circular(10),
                //                           image: DecorationImage(
                //                             fit: BoxFit.cover,
                //                             image: imageProvider,
                //                           ),
                //                         ),
                //                       )),
                //                   placeholder: ((context, url) => Center(
                //                         child: LoadingAnimationWidget
                //                             .threeArchedCircle(
                //                                 color: Colors.cyan, size: 40),
                //                       )),
                //                 ),
                //               ),
                //             );
                //           }),
                //     ),
                //   ),
                // ),

                const SizedBox(
                  height: 9,
                ),
                GestureDetector(
                  onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) =>  FullScreen(imageurl: goodm[inde,),
                    //       ),
                    //  );
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    // height: double.infinity,
                    height: 180,
                    //padding: const EdgeInsets.symmetric(horizontal: 2),
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    // margin: const EdgeInsets.symmetric(horizontal: 7),
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 3.4,
                          );
                        },
                        itemCount: goodm.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext ctx, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(_goodm(index));
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         FullScreen(imageurl: goodm[index]),
                              //   ),
                              // );
                            },
                            child: Container(
                              height: 126,
                              width: 130,

                              decoration: BoxDecoration(
                                  // color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     image: DecorationImage(
                              //         fit: BoxFit.cover,
                              //         image: NetworkImage(galasy[index]),),),
                              child: CachedNetworkImage(
                                imageUrl: goodm[index],
                                imageBuilder: ((context, imageProvider) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: imageProvider,
                                        ),
                                      ),
                                    )),
                                placeholder: ((context, url) => Center(
                                      child: LoadingAnimationWidget
                                          .threeArchedCircle(
                                              color: Colors.cyan, size: 25),
                                    )),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7.6, vertical: 8),
                  child: Container(
                    height: 26,
                    decoration: BoxDecoration(
                        // gradient: const LinearGradient(
                        //   colors: [
                        //     Colors.blue,
                        //     Colors.lime,
                        //     Colors.teal,
                        //   ],
                        // ),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Good Night',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => MusicPlayer(),
                    //   ),
                    // );
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    // height: double.infinity,
                    height: 180,
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 3.4,
                          );
                        },
                        itemCount: Goodnight.length,
                        // shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext ctx, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(_goodn(index));
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         FullScreen(imageurl: Goodnight[index]),
                              //   ),
                              // );
                            },
                            child: Container(
                              height: 126,
                              width: 130,

                              decoration: BoxDecoration(
                                  // color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     image: DecorationImage(
                              //         fit: BoxFit.cover,
                              //         image: NetworkImage(galasy[index]),),),
                              child: CachedNetworkImage(
                                imageUrl: Goodnight[index],
                                imageBuilder: ((context, imageProvider) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: imageProvider,
                                        ),
                                      ),
                                    )),
                                placeholder: ((context, url) => Center(
                                      child: LoadingAnimationWidget
                                          .threeArchedCircle(
                                              color: Colors.cyan, size: 25),
                                    )),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),

                // GestureDetector(
                //   // onTap: () => routToDetails(snapshot.data[index]),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(200),
                //     ),
                //     width: double.infinity,
                //     margin: const EdgeInsets.symmetric(
                //       horizontal: 10,
                //     ),
                //     height: 200,
                //     child: Swiper(
                //       autoplayDelay: 7000,
                //       //curve: Curves.elasticOut,
                //       //autoplayDelay: 200,
                //       itemCount: 4,
                //       itemBuilder: (BuildContext context, int index) {
                //         return Image.asset(
                //           list[index],
                //           fit: BoxFit.cover,
                //         );
                //       },
                //       customLayoutOption:
                //           CustomLayoutOption(startIndex: -1, stateCount: 3),
                //       pagination: const SwiperPagination(),
                //       viewportFraction: 0.3,
                //       layout: SwiperLayout.STACK,
                //       itemWidth: 400,
                //       //autoplay: true,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                // ShareBox(),

                // const SizedBox(
                //   height: 10,
                // ),
                // Qutos(),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Colors.blue,
                    //     Colors.cyan,
                    //     Colors.teal,
                    //     Colors.limeAccent
                    //   ],
                    // ),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 1),
                  child: const Text(
                    'Random pictures',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // CustomScrollView(
                //   slivers: [
                //     Container(
                //       child: StaggeredGridView.countBuilder(
                //           crossAxisCount: 2,
                //           crossAxisSpacing: 10,
                //           mainAxisSpacing: 12,
                //           itemBuilder: (context, index) {
                //             return Container(
                //               decoration: BoxDecoration(
                //                 image: DecorationImage(
                //                   image: NetworkImage(galasy[index]),
                //                 ),
                //               ),
                //             );
                //           },
                //           staggeredTileBuilder: (index) {
                //             return StaggeredTile.count(
                //                 1, index.isEven ? 1.2 : 1.8);
                //           }),
                //     ),
                //   ],
                // ),
                // Horizon(),
              ],
            ),
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 5),
        //   child: Container(
        //     child: StaggeredGridView.countBuilder(
        //       crossAxisCount: 2,
        //       itemCount: flowrs.length,
        //       shrinkWrap: true,
        //       physics: const NeverScrollableScrollPhysics(),
        //       itemBuilder: (BuildContext context, int index) => GestureDetector(
        //         onTap: () {
        //           Navigator.of(context).push(_fullscreen(index));
        //           // Navigator.push(
        //           //     context,
        //           //     MaterialPageRoute(
        //           //       builder: (context) => FullScreen(
        //           //         imageurl: flowrs[index]['src']['large2x'],
        //           //       ),
        //           //     ));

        //           // Navigator.push(
        //           //   context,
        //           //   MaterialPageRoute(
        //           //     builder: (context) => FullScreen(imageurl: images[index]),
        //           //   ),
        //           // );
        //         },
        //         child: CachedNetworkImage(
        //           imageUrl: flowrs[index]['src']["large2x"],
        //           imageBuilder: ((context, imageProvider) => Container(
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(10),
        //                   image: DecorationImage(
        //                     fit: BoxFit.cover,
        //                     image: imageProvider,
        //                   ),
        //                 ),
        //               )),
        //           placeholder: ((context, url) => Center(
        //                 child: LoadingAnimationWidget.threeArchedCircle(
        //                     color: Colors.cyan, size: 40),
        //               )),
        //           errorWidget: (context, url, error) => const Icon(
        //             Icons.image_not_supported_rounded,
        //             color: Colors.black,
        //           ),
        //         ),
        //       ),
        //       // staggeredTileBuilder: (int index) =>
        //       //     StaggeredTile.count(2, index.isEven ? 2 : 1),
        //       staggeredTileBuilder: (index) {
        //         return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
        //       },
        //       // mainAxisSpacing: 4.0,
        //       // crossAxisSpacing: 4.0,
        //       //  crossAxisCount: 2,
        //       crossAxisSpacing: 10,
        //       mainAxisSpacing: 12,
        //     ),
        //   ),
        // ),
        // SizedBox(
        //   height: 20,
        // ),
        // Container(
        //   height: 40,
        //   width: 120,
        //   color: Colors.green,
        //   child: Center(child: Text('puplar')),f
        // ),
        // SizedBox(
        //   height: 20,
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: tech.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(_tech(index));
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => FullScreen(
                  //         imageurl: tech[index]['src']['large2x'],
                  //       ),
                  //     ));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => FullScreen(imageurl: images[index]),
                  //   ),
                  // );
                },
                child: CachedNetworkImage(
                  imageUrl: tech[index]['src']["large2x"],
                  imageBuilder: ((context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageProvider,
                          ),
                        ),
                      )),
                  placeholder: ((context, url) => Center(
                        child: LoadingAnimationWidget.threeArchedCircle(
                            color: Colors.cyan, size: 25),
                      )),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.image_not_supported_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
              // staggeredTileBuilder: (int index) =>
              //     StaggeredTile.count(2, index.isEven ? 2 : 1),
              staggeredTileBuilder: (index) {
                return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
              },
              // mainAxisSpacing: 4.0,
              // crossAxisSpacing: 4.0,
              //  crossAxisCount: 2,
              crossAxisSpacing: 3.4,
              mainAxisSpacing: 3.4,
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 5),
        //   child: Container(
        //     child: StaggeredGridView.countBuilder(
        //       crossAxisCount: 2,
        //       itemCount: win.length,
        //       shrinkWrap: true,
        //       physics: const NeverScrollableScrollPhysics(),
        //       itemBuilder: (BuildContext context, int index) => GestureDetector(
        //         onTap: () {
        //           Navigator.of(context).push(_win(index));
        //           // Navigator.push(
        //           //     context,
        //           //     MaterialPageRoute(
        //           //       builder: (context) => FullScreen(
        //           //         imageurl: win[index]['src']['large2x'],
        //           //       ),
        //           //     ));

        //           // Navigator.push(
        //           //   context,
        //           //   MaterialPageRoute(
        //           //     builder: (context) => FullScreen(imageurl: images[index]),
        //           //   ),
        //           // );
        //         },
        //         child: CachedNetworkImage(
        //           imageUrl: win[index]['src']["large2x"],
        //           imageBuilder: ((context, imageProvider) => Container(
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(10),
        //                   image: DecorationImage(
        //                     fit: BoxFit.cover,
        //                     image: imageProvider,
        //                   ),
        //                 ),
        //               )),
        //           placeholder: ((context, url) => Center(
        //                 child: LoadingAnimationWidget.threeArchedCircle(
        //                     color: Colors.cyan, size: 40),
        //               )),
        //           errorWidget: (context, url, error) => const Icon(
        //             Icons.image_not_supported_rounded,
        //             color: Colors.black,
        //           ),
        //         ),
        //       ),
        //       // staggeredTileBuilder: (int index) =>
        //       //     StaggeredTile.count(2, index.isEven ? 2 : 1),
        //       staggeredTileBuilder: (index) {
        //         return StaggeredTile.count(1, index.isEven ? 1.2 : 1.0);
        //       },
        //       // mainAxisSpacing: 4.0,
        //       // crossAxisSpacing: 4.0,
        //       //  crossAxisCount: 2,
        //       crossAxisSpacing: 10,
        //       mainAxisSpacing: 12,
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: photos.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => FullScreen(
                  //         imageurl: photos[index]['src']['large2x'],
                  //       ),
                  //     ));
                  Navigator.of(context).push(_photos(index));

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => FullScreen(imageurl: images[index]),
                  //   ),
                  // );
                },
                child: CachedNetworkImage(
                  imageUrl: photos[index]['src']["large2x"],
                  imageBuilder: ((context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageProvider,
                          ),
                        ),
                      )),
                  placeholder: ((context, url) => Center(
                        child: LoadingAnimationWidget.threeArchedCircle(
                            color: Colors.cyan, size: 25),
                      )),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.image_not_supported_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
              // staggeredTileBuilder: (int index) =>
              //     StaggeredTile.count(2, index.isEven ? 2 : 1),
              staggeredTileBuilder: (index) {
                return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
              },
              // mainAxisSpacing: 4.0,
              // crossAxisSpacing: 4.0,
              //  crossAxisCount: 2,
              crossAxisSpacing: 3.4,
              mainAxisSpacing: 3.4,
            ),
          ),
        ),
      ],
    );
  }

  Route _tech(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: tech[index]['src']["large2x"],
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _win(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: win[index]['src']["large2x"],
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _photos(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: photos[index]['src']["large2x"],
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: amazing[index],
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _motivation(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: motv[index]['src']["large2x"],
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _goodm(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: goodm[index],
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _goodn(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: Goodnight[index],
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=Fish&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }
  // fetchapi() async {
  //   isLoding = true;
  //   await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
  //       headers: {
  //         'Authorization':
  //             '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96'
  //       }).then((value) {
  //     Map result = jsonDecode(value.body);
  //     setState(() {
  //       images = result['photos'];
  //     });
  //     isLoding = false;
  //     // print(images[0]);
  //   });
  // }
}

/*
body: 

*/
/*Stack(
        children: <Widget>[
          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  brightness: Brightness.dark,
                  primary: true,
                  floating: true,
                  backgroundColor: HexColor('#6E8625'), //.withOpacity(0.3),
                  snap: true,
                  pinned: false,
                  bottom: TabBar(
                    tabs: const [
                      Tab(
                        child: Text(
                          "Popular",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Home",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "page",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Qutos",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                    controller: _tabController,
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Jalc(
                  showNavigation: widget.showNavigation,
                  hideNavigation: widget.hideNavigation,
                ),
                Wallpaper(),
                Nature(),
                AnimateScrenn(),
                //HomeScreenS(),
              ],
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              child: SafeArea(
                top: false,
                child: AnimatedContainer(
                  duration: Duration(microseconds: 20),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: 
                    AppBar(
                      flexibleSpace: Container(
                        height: 60,
                        color: HexColor('#AE8625'),
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Text(
                            "WELCOME",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      actions: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Ganna(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 45,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/hotstar.jpeg'))),
                            ),
                          ),
                        )
                      ],
                      centerTitle: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
*/

class catescren extends StatefulWidget {
  final String screen;
  const catescren({Key? key, required this.screen}) : super(key: key);

  @override
  State<catescren> createState() => _catescrenState();
}

class _catescrenState extends State<catescren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JACK')),
    );
  }
}
/*



Container(
                    height: 240,
                    child: Container(
                      padding: EdgeInsets.zero,
                      margin: const EdgeInsets.all(10),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        //color: Colors.green,
                        // gradient: const LinearGradient(
                        //   colors: [
                        //     Colors.teal,
                        //     Colors.green,
                        //     Colors.white,
                        //   ],
                        // ),
                      ),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          AspectRatio(
                            aspectRatio: 2.6 / 3,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/n8.jpg'),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => VideoApp(),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.download,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 2.6 / 3,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/n6.jpg',
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.download,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 2.6 / 3,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/n6.jpg'),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.download,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 2.6 / 3,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  scale: 1.1,
                                  image: AssetImage('assets/n5.jpg'),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.download,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


*/
// {
// "id":101,
// "company" : "GeeksForGeeks",
// "Topics" : { "Data Structure",
// "Algorithm",
// "Gate Topics" }
// }
// // photos[index][widget][text][src]