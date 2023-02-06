import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebaseapp/drawer/video.dart';
import 'package:firebaseapp/json/homejson.dart';
import 'package:firebaseapp/jsonfo/jsonfile.dart';
import 'package:firebaseapp/wallss/servies/fulldisplay.dart';
import 'package:firebaseapp/wallss/servies/fullscreen.dart';
import 'package:firebaseapp/wallss/servies/models.dart';
import 'package:firebaseapp/wallss/servies/photosmodel.dart';
import 'package:firebaseapp/widgets.dart/newpagefull.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Flowers extends StatefulWidget {
  @override
  State<Flowers> createState() => _FlowersState();
}

class _FlowersState extends State<Flowers> {
  List images = [];
  late List flowrs = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
    peacock();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=rose&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96',
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  peacock() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=peacock&per_page=100';
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

  loadmore() async {
    setState(() {
      page = page + 1;
    });
    // String url = 'https://api.pexels.com/v1/curated?per_page=80&page=$page';
    String url =
        // 'https://api.pexels.com/v1/search?query=nature&per_page=1$page';
        'https://api.pexels.com/v1/search?query=Tigers&per_page=1$page';

    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rose Images'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           //  ImageView(
                                //           //   imgPath: images[index]['src']['large2x'],
                                //           // ),
                                //           Fullnew(
                                //               imageurl: images[index]['src']
                                //                   ['large2x'])
                                //       //   FullScreen(
                                //       // imageurl: images[index]['src']['large2x'],
                                //       // ),
                                //       ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: images[index]['src']["large2x"],
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
                                  color: Colors.grey,
                                ),
                              ),
                              // CachedNetworkImage(
                              //   imageUrl: images[index],
                              //   imageBuilder: (context, imageProvider) =>
                              //       Container(
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10),
                              //       image: DecorationImage(
                              //           fit: BoxFit.cover,
                              //           image: imageProvider),
                              //     ),
                              //   ),
                              //   placeholder: (context, url) => Center(
                              //     child: LoadingAnimationWidget.stretchedDots(
                              //       color: Colors.cyan,
                              //       size: 25,
                              //     ),
                              //   ),
                              // ),
                              //     Container(
                              //   decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //       fit: BoxFit.cover,
                              //       image: NetworkImage(
                              //         //nd[index]
                              //         images[index]['src']["large2x"],
                              //       ),
                              //     ),
                              //     color: Colors.black,
                              //     borderRadius: BorderRadius.circular(20),
                              //     border: const Border(
                              //       top: BorderSide(
                              //           width: 4,
                              //           color: Colors.white,
                              //           style: BorderStyle.solid), //BorderSide
                              //       bottom: BorderSide(
                              //           width: 4,
                              //           color: Colors.white,
                              //           style: BorderStyle.solid), //BorderSide
                              //       left: BorderSide(
                              //           width: 4,
                              //           color: Colors.white,
                              //           style: BorderStyle.solid), //Borderside
                              //       right: BorderSide(
                              //           width: 4,
                              //           color: Colors.white,
                              //           style: BorderStyle.solid), //BorderSide
                              //     ),
                              //   ),
                              // ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: flowrs[index]['src']["large2x"],
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
}

class Peacock extends StatefulWidget {
  const Peacock({Key? key}) : super(key: key);

  @override
  State<Peacock> createState() => _PeacockState();
}

class _PeacockState extends State<Peacock> {
  List images = [];
  late List flowrs = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
    peacock();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=rose&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96',
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  peacock() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=peacock&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peacock Images'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: flowrs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         //  ImageView(
                                //         //   imgPath: images[index]['src']['large2x'],
                                //         // ),
                                //         FullScreen(
                                //       imageurl: flowrs[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: flowrs[index]['src']["large2x"],
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
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: flowrs[index]['src']["large2x"],
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
}

class Birds extends StatefulWidget {
  const Birds({Key? key}) : super(key: key);

  @override
  State<Birds> createState() => _BirdsState();
}

class _BirdsState extends State<Birds> {
  List images = [];
  late List flowrs = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
    peacock();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=rose&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96',
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  peacock() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=bird&per_page=100';
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

  loadmore() async {
    setState(() {
      page = page + 1;
    });
    // String url = 'https://api.pexels.com/v1/curated?per_page=80&page=$page';
    String url =
        // 'https://api.pexels.com/v1/search?query=nature&per_page=1$page';
        'https://api.pexels.com/v1/search?query=Tigers&per_page=1$page';

    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birds Images'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: flowrs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         //  ImageView(
                                //         //   imgPath: images[index]['src']['large2x'],
                                //         // ),
                                //         FullScreen(
                                //       imageurl: flowrs[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: flowrs[index]['src']["large2x"],
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
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: flowrs[index]['src']["large2x"],
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
}

class Buterfly extends StatefulWidget {
  const Buterfly({Key? key}) : super(key: key);

  @override
  State<Buterfly> createState() => _ButerflyState();
}

class _ButerflyState extends State<Buterfly> {
  List images = [];
  late List flowrs = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
    peacock();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=rose&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96',
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  peacock() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url =
        'https://api.pexels.com/v1/search?query=butterfly&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('butterfly Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: flowrs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         //  ImageView(
                                //         //   imgPath: images[index]['src']['large2x'],
                                //         // ),
                                //         FullScreen(
                                //       imageurl: flowrs[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: flowrs[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: flowrs[index]['src']["large2x"],
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
}

class Sea extends StatefulWidget {
  const Sea({Key? key}) : super(key: key);

  @override
  State<Sea> createState() => _SeaState();
}

class _SeaState extends State<Sea> {
  List images = [];
  late List flowrs = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
    peacock();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=Sea&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96',
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  peacock() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=Sea&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sea Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: flowrs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         //  ImageView(
                                //         //   imgPath: images[index]['src']['large2x'],
                                //         // ),
                                //         FullScreen(
                                //       imageurl: flowrs[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: flowrs[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: flowrs[index]['src']["large2x"],
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
}

class Water extends StatefulWidget {
  const Water({Key? key}) : super(key: key);

  @override
  State<Water> createState() => _WaterState();
}

class _WaterState extends State<Water> {
  List images = [];
  late List flowrs = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
    peacock();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=water&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96',
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  peacock() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=water&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 4,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: flowrs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         //  ImageView(
                                //         //   imgPath: images[index]['src']['large2x'],
                                //         // ),
                                //         FullScreen(
                                //       imageurl: flowrs[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: flowrs[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: flowrs[index]['src']["large2x"],
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
}

class Blur extends StatefulWidget {
  const Blur({Key? key}) : super(key: key);

  @override
  State<Blur> createState() => _BlurState();
}

class _BlurState extends State<Blur> {
  List images = [];
  late List flowrs = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
    peacock();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=rose&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96',
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  peacock() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=Blur&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blur Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: flowrs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         //  ImageView(
                                //         //   imgPath: images[index]['src']['large2x'],
                                //         // ),
                                //         FullScreen(
                                //       imageurl: flowrs[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: flowrs[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: flowrs[index]['src']["large2x"],
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
}

class Dark extends StatefulWidget {
  const Dark({Key? key}) : super(key: key);

  @override
  State<Dark> createState() => _DarkState();
}

class _DarkState extends State<Dark> {
  List images = [];
  late List flowrs = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
    peacock();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=Dark&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96',
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  peacock() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=Dark&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: flowrs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         //  ImageView(
                                //         //   imgPath: images[index]['src']['large2x'],
                                //         // ),
                                //         FullScreen(
                                //       imageurl: flowrs[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: flowrs[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: flowrs[index]['src']["large2x"],
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
}

class Alone extends StatefulWidget {
  const Alone({Key? key}) : super(key: key);

  @override
  State<Alone> createState() => _AloneState();
}

class _AloneState extends State<Alone> {
  List images = [];
  late List flowrs = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
    peacock();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=rose&per_page=100';
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96',
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  peacock() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=Alone&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alone Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: flowrs.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         //  ImageView(
                                //         //   imgPath: images[index]['src']['large2x'],
                                //         // ),
                                //         FullScreen(
                                //       imageurl: flowrs[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: flowrs[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: flowrs[index]['src']["large2x"],
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
}

class Parrot extends StatefulWidget {
  const Parrot({Key? key}) : super(key: key);

  @override
  State<Parrot> createState() => _ParrotState();
}

class _ParrotState extends State<Parrot> {
  List images = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=Parrot&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parrot Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => FullScreen(
                                //       imageurl: images[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: images[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // InkWell(
                  //   hoverColor: Colors.green,
                  //   onTap: () {},
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 10),
                  //     child: Container(
                  //       width: 120,
                  //       color: Colors.black,
                  //       child: const Center(
                  //         child: Text(
                  //           'load More',
                  //           style: TextStyle(fontSize: 22, color: Colors.white),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: images[index]['src']["large2x"],
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
}

class Animation extends StatefulWidget {
  const Animation({Key? key}) : super(key: key);

  @override
  State<Animation> createState() => _AnimationState();
}

class _AnimationState extends State<Animation> {
  List images = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url =
        'https://api.pexels.com/v1/search?query=Animation&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => FullScreen(
                                //       imageurl: images[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: images[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: images[index]['src']["large2x"],
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
}

class Car extends StatefulWidget {
  const Car({Key? key}) : super(key: key);

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  List images = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=Car&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => FullScreen(
                                //       imageurl: images[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: images[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: images[index]['src']["large2x"],
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
}

class LandaScape extends StatefulWidget {
  const LandaScape({Key? key}) : super(key: key);

  @override
  State<LandaScape> createState() => _LandaScapeState();
}

class _LandaScapeState extends State<LandaScape> {
  List images = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url =
        'https://api.pexels.com/v1/search?query=Landscape&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => FullScreen(
                                //       imageurl: images[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: images[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: images[index]['src']["large2x"],
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
}

class City extends StatefulWidget {
  const City({Key? key}) : super(key: key);

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  List images = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=City&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => FullScreen(
                                //       imageurl: images[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: images[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: images[index]['src']["large2x"],
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
}

class Boxser extends StatefulWidget {
  const Boxser({Key? key}) : super(key: key);

  @override
  State<Boxser> createState() => _BoxserState();
}

class _BoxserState extends State<Boxser> {
  List images = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=Boxser&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boxser Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => FullScreen(
                                //       imageurl: images[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: images[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: images[index]['src']["large2x"],
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
}

class Motivation extends StatefulWidget {
  const Motivation({Key? key}) : super(key: key);

  @override
  State<Motivation> createState() => _MotivationState();
}

class _MotivationState extends State<Motivation> {
  List images = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    motivation();
  }

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
        images = result['photos'];
      });
      isLoading = false;
      // print(images[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boxser Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => FullScreen(
                                //       imageurl: images[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: images[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: images[index]['src']["large2x"],
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
}

class Lion extends StatefulWidget {
  const Lion({Key? key}) : super(key: key);

  @override
  State<Lion> createState() => _LionState();
}

class _LionState extends State<Lion> {
  List images = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=Lion&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lion Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => FullScreen(
                                //       imageurl: images[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child:
                                  //  CachedNetworkImage(
                                  //   imageUrl: nd[index],
                                  //   imageBuilder: (context, imageProvider) =>
                                  //       Container(
                                  //     decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(10),
                                  //       image: DecorationImage(
                                  //           fit: BoxFit.cover,
                                  //           image: imageProvider),
                                  //     ),
                                  //   ),
                                  //   placeholder: (context, url) => Center(
                                  //     child: LoadingAnimationWidget.stretchedDots(
                                  //       color: Colors.cyan,
                                  //       size: 25,
                                  //     ),
                                  //   ),
                                  // ),
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      //nd[index]
                                      images[index]['src']["large2x"],
                                    ),
                                  ),
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                  border: const Border(
                                    top: BorderSide(
                                        width: 4,
                                        color: Colors.white,
                                        style: BorderStyle.solid), //BorderSide
                                    bottom: BorderSide(
                                        width: 4,
                                        color: Colors.white,
                                        style: BorderStyle.solid), //BorderSide
                                    left: BorderSide(
                                        width: 4,
                                        color: Colors.white,
                                        style: BorderStyle.solid), //Borderside
                                    right: BorderSide(
                                        width: 4,
                                        color: Colors.white,
                                        style: BorderStyle.solid), //BorderSide
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: images[index]['src']["large2x"],
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
}

class Natur extends StatefulWidget {
  const Natur({Key? key}) : super(key: key);

  @override
  State<Natur> createState() => _NaturState();
}

class _NaturState extends State<Natur> {
  List images = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=Nature&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nature Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => FullScreen(
                                //       imageurl: images[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: images[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                              // CachedNetworkImage(
                              //   imageUrl: nd[index],
                              //   imageBuilder: (context, imageProvider) =>
                              //       Container(
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10),
                              //       image: DecorationImage(
                              //           fit: BoxFit.cover,
                              //           image: imageProvider),
                              //     ),
                              //   ),
                              //   placeholder: (context, url) => Center(
                              //     child: LoadingAnimationWidget.stretchedDots(
                              //       color: Colors.cyan,
                              //       size: 25,
                              //     ),
                              //   ),
                              // ),
                              //     Container(
                              //   decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //       fit: BoxFit.cover,
                              //       image: NetworkImage(
                              //         //nd[index]
                              //         images[index]['src']["large2x"],
                              //       ),
                              //     ),
                              //     color: Colors.black,
                              //     borderRadius: BorderRadius.circular(20),
                              //     border: const Border(
                              //       top: BorderSide(
                              //           width: 4,
                              //           color: Colors.white,
                              //           style: BorderStyle.solid), //BorderSide
                              //       bottom: BorderSide(
                              //           width: 4,
                              //           color: Colors.white,
                              //           style: BorderStyle.solid), //BorderSide
                              //       left: BorderSide(
                              //           width: 4,
                              //           color: Colors.white,
                              //           style: BorderStyle.solid), //Borderside
                              //       right: BorderSide(
                              //           width: 4,
                              //           color: Colors.white,
                              //           style: BorderStyle.solid), //BorderSide
                              //     ),
                              //   ),
                              // ),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: images[index]['src']["large2x"],
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
}

class Sunset extends StatefulWidget {
  const Sunset({Key? key}) : super(key: key);

  @override
  State<Sunset> createState() => _SunsetState();
}

class _SunsetState extends State<Sunset> {
  List images = [];
  int page = 1;
  late bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    isLoading = true;
    //  https://api.pexels.com/v1/curated?per_page=80
    //String data = 'https://api.pexels.com/videos/popular?per_page=1';
    String url = 'https://api.pexels.com/v1/search?query=Sunset&per_page=100';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunset Images'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  color: Colors.cyan,
                  size: 40,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: images.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() {
                                Navigator.of(context).push(_fullscreen(index));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => FullScreen(
                                //       imageurl: images[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                              }),
                              child: CachedNetworkImage(
                                imageUrl: images[index]['src']["large2x"],
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: imageProvider),
                                  ),
                                ),
                                placeholder: (context, url) => Center(
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                    color: Colors.cyan,
                                    size: 25,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                              // CachedNetworkImage(
                              //   imageUrl: nd[index],
                              //   imageBuilder: (context, imageProvider) =>
                              //       Container(
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10),
                              //       image: DecorationImage(
                              //           fit: BoxFit.cover,
                              //           image: imageProvider),
                              //     ),
                              //   ),
                              //   placeholder: (context, url) => Center(
                              //     child: LoadingAnimationWidget.stretchedDots(
                              //       color: Colors.cyan,
                              //       size: 25,
                              //     ),
                              //   ),
                              // ),
                              //     Container(
                              //   decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //       fit: BoxFit.cover,
                              //       image: NetworkImage(
                              //         //nd[index]
                              //         images[index]['src']["large2x"],
                              //       ),
                              //     ),
                              //     color: Colors.black,
                              //     borderRadius: BorderRadius.circular(20),
                              //     border: const Border(
                              //       top: BorderSide(
                              //           width: 4,
                              //           color: Colors.white,
                              //           style: BorderStyle.solid), //BorderSide
                              //       bottom: BorderSide(
                              //           width: 4,
                              //           color: Colors.white,
                              //           style: BorderStyle.solid), //BorderSide
                              //       left: BorderSide(
                              //           width: 4,
                              //           color: Colors.white,
                              //           style: BorderStyle.solid), //Borderside
                              //       right: BorderSide(
                              //           width: 4,
                              //           color: Colors.white,
                              //           style: BorderStyle.solid), //BorderSide
                              //     ),
                              //   ),
                              // ),
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
      ),
    );
  }

  Route _fullscreen(index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FullScreen(
        imageurl: images[index]['src']["large2x"],
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
}

class CategorieScreen extends StatefulWidget {
  final String categorie;

  const CategorieScreen({Key? key, required this.categorie}) : super(key: key);

  @override
  _CategorieScreenState createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  List<PhotosModel> photos = [];

  getCategorieWallpaper() async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=${widget.categorie}&per_page=30&page=1"),
        headers: {
          "Authorization":
              '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96'
        }).then((value) {
      //print(value.body);

      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        //print(element);
        PhotosModel photosModel = PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
        //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
      });

      setState(() {});
    });
  }

  @override
  void initState() {
    getCategorieWallpaper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: brandName(),
        elevation: 0.0,
        actions: <Widget>[
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: wallPaper(photos, context),
      ),
    );
  }
}

Widget wallPaper(List<PhotosModel> listPhotos, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: listPhotos.map((PhotosModel photoModel) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => ImageView(
              //               imgPath: photoModel.src.portrait,
              //             )));
            },
            child: Hero(
              tag: photoModel.src!.portrait.toString(),
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: photoModel.src!.portrait.toString(),
                    placeholder: (context, url) => Container(
                      color: Color(0xfff5f8fd),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ));
        }).toList()),
  );
}
