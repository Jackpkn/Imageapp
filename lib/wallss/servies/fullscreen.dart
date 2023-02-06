import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FullScreen extends StatefulWidget {
  final String imageurl;

  const FullScreen({Key? key, required this.imageurl}) : super(key: key);
  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen>
    with SingleTickerProviderStateMixin {
  // Future<void> setwallpaper() async {
  //   int location = WallpaperManager.HOME_SCREEN;

  //   var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
  //   final String result =
  //       await WallpaperManager.setWallpaperFromFile(file.path, location);
  // }

  final index = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final double minScale = 1;
  final double maxScale = 4;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  late TransformationController controller;
  late AnimationController animationController;
  Animation<Matrix4>? animation;
  @override
  void initState() {
    super.initState();
    controller = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() => controller.value = animation!.value);
  }

  @override
  void deactivate() {
    controller.dispose();
    animationController.dispose();
    super.deactivate();
  }

  _getHttp() async {
    var response = await Dio().get(widget.imageurl,
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    print(result);
    //_toastInfo("$result");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: Container(
        margin: EdgeInsets.zero,
        child: Stack(
          children: [
            Hero(
              tag: widget.imageurl,
              child: Container(
                padding: EdgeInsets.zero,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: InteractiveViewer(
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Center(
                      child: LoadingAnimationWidget.threeArchedCircle(
                        color: Colors.cyan,
                        size: 30,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.image_not_supported_rounded,
                      color: Colors.grey,
                    ),
                    imageUrl: widget.imageurl,
                    // placeholder: (context, url) => Container(
                    //   color: const Color(0xfff5f8fd),
                    // ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(
            //     left: 0,
            //     right: 0,
            //     bottom: 0,
            //     top: 0,
            //   ),
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       fit: BoxFit.cover,
            //       image: NetworkImage(
            //         widget.imageurl,
            //       ),
            //     ),
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   // child: PageView.builder(
            //   //   controller: _pageController,
            //   //   itemCount: widget.imageurl.length,
            //   //   itemBuilder: (context, index) {
            //   //     return Container(
            //   //       child: Image.network(widget.imageurl),
            //   //     );
            //   //   },
            //   // ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(
            //       top: 70, bottom: 20, right: 30, left: 90),
            //   height: 90,
            //   width: 140,
            //   decoration: BoxDecoration(
            //       color: Colors.black, borderRadius: BorderRadius.circular(20)),
            //   // width: double.infinity,
            //   child: const Padding(
            //     padding: EdgeInsets.only(bottom: 20),
            //     child: Center(
            //       child: Text(
            //         'Set Wallpaper',
            //         style: TextStyle(
            //           fontSize: 20,
            //           color: Colors.green,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Center(
            //   child: Hero(
            //     tag: widget.imageurl,
            //     child: Container(
            //       //      height: MediaQuery.of(context).size.height,
            //       // width: MediaQuery.of(context).size.width,
            //       height: double.infinity,
            //       width: double.infinity,
            //       margin: const EdgeInsets.symmetric(horizontal: 1),
            //       child: Padding(
            //         padding: const EdgeInsets.only(top: 1, bottom: 1),
            //         child: Center(
            //           child: InteractiveViewer(
            //             onInteractionEnd: (details) {
            //               resetAnimation();
            //             },
            //             maxScale: maxScale,
            //             minScale: minScale,
            //             panEnabled: false,
            //             clipBehavior: Clip.none,
            //             child: ClipRRect(
            //               borderRadius: BorderRadius.circular(20),
            //               child: Image.network(
            //                 widget.imageurl,
            //                 //'https://cdn.pixabay.com/photo/2018/01/12/10/19/fantasy-3077928_1280.jpg',
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        // _save();
                        _getHttp();
                        Fluttertoast.showToast(
                            msg: 'successfully saved',
                            textColor: Colors.black,
                            backgroundColor: Colors.amber,
                            fontSize: 20);
                        // Imgaedown();
                        // if (kIsWeb) {
                        //   _launchURL(widget.imgPath);
                        //   //js.context.callMethod('downloadUrl',[widget.imgPath]);
                        //   //response = await dio.download(widget.imgPath, "./xx.html");
                        // } else {
                        //   _save();
                        // }
                        //Navigator.pop(context);
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xff1C1B1B).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white24, width: 1),
                                  borderRadius: BorderRadius.circular(40),
                                  gradient: const LinearGradient(
                                      colors: [
                                        // Color(0x36FFFFFF),
                                        // Color(0x0FFFFFFF)
                                        Colors.cyan,
                                        Colors.teal,
                                        Colors.blue,
                                      ],
                                      begin: FractionalOffset.topLeft,
                                      end: FractionalOffset.bottomRight)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Text(
                                    "Set Wallpaper",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    "Image will be saved in gallery",
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.white70),
                                  ),
                                ],
                              )),
                        ],
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void resetAnimation() {
    animation = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
  }
}
