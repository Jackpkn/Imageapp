import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';

class Fullnew extends StatefulWidget {
  final String imageurl;

  const Fullnew({required this.imageurl});
  
  @override
  _FullnewState createState() => _FullnewState();
}

class _FullnewState extends State<Fullnew> {
  // Future<void> setwallpaper() async {
  //   int location = WallpaperManager.HOME_SCREEN;
  //
  //   var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
  //   final String result =
  //       await WallpaperManager.setWallpaperFromFile(file.path, location);
  // }
  //
  // final index = 0;
  // PageController _pageController = PageController(initialPage: 0);
  //
  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.zero,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 20, top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      widget.imageurl,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                // child: PageView.builder(
                //   controller: _pageController,
                //   itemCount: widget.imageurl.length,
                //   itemBuilder: (context, index) {
                //     return Container(
                //       child: Image.network(widget.imageurl),
                //     );
                //   },
                // ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: InkWell(
                  hoverColor: Colors.green,
                  focusColor: Colors.orange,
                  highlightColor: Colors.amber,
                  onTap: () {
                    // setwallpaper();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 100),
                        height: 60,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        // width: double.infinity,
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Center(
                            child: Text(
                              'Set Wallpaper',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
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
    );
  }
}
