import 'dart:convert';

import 'package:firebaseapp/wallss/servies/cotroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AnimateScrenn extends StatefulWidget {
  @override
  State<AnimateScrenn> createState() => _AnimateScrennState();
}

class _AnimateScrennState extends State<AnimateScrenn> {
  SimpleUIController homeController = Get.put(SimpleUIController());
  late bool loaDing = false;
  // List images = [];

  // int page = 1;
  late bool isLoading = false;
  // @override
  // void initState() {
  //   super.initState();
  //   fae();
  // }

  // fae() async {
  //   isLoading = true;
  //   await http
  //       .get(Uri.parse('uri'), headers: {'Authorizaton': 'rul'}).then((value) {
  //     Map results = jsonDecode(value.body);
  //     setState(() {
  //       images = results['photos'];
  //     });
  //     isLoading = true;
  //   });
  // }

  // fetchapi() async {
  //   isLoading = true;
  //   await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=100'),
  //       headers: {
  //         'Authorization':
  //             '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96'
  //       }).then((value) {
  //     Map result = jsonDecode(value.body);
  //     setState(() {
  //       images = result['photos'];
  //     });
  //     isLoading = false;
  //     // print(images[0]);
  //   });
  // }

  // loadmore() async {
  //   setState(() {
  //     page = page + 1;
  //   });
  //   // String url = 'https://api.pexels.com/v1/curated?per_page=80&page=$page';
  //   String url =
  //       'https://api.pexels.com/v1/search?query=nature&per_page=1$page';
  //   await http.get(Uri.parse(url), headers: {
  //     'Authorization':
  //         '563492ad6f91700001000001f85658bc2aba4bb3b2df7f1583780c96'
  //   }).then((value) {
  //     Map result = jsonDecode(value.body);
  //     setState(() {
  //       images.addAll(result['photos']);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: Column(
            children: [
              Expanded(
                flex: 13,
                child: isLoading
                    ? Center(
                        child: LoadingAnimationWidget.stretchedDots(
                          color: Colors.cyan,
                          size: 30,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.custom(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate: SliverQuiltedGridDelegate(
                            crossAxisCount: 4,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            repeatPattern: QuiltedGridRepeatPattern.inverted,
                            pattern: const [
                              QuiltedGridTile(2, 2),
                              QuiltedGridTile(1, 1),
                              QuiltedGridTile(2, 1),
                              QuiltedGridTile(1, 1),
                            ],
                          ),
                          childrenDelegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (ctx) => FullScreen(
                                  //         imageurl: images[index]['src']
                                  //             ['large2x']),
                                  //   ),
                                  // );
                                },
                                child: Hero(
                                  tag: homeController.photos[index].id!,
                                  // tag: homeController.photos[index].id!,
                                  child: Container(
                                    margin: const EdgeInsets.all(2),
                                    // child: Container(
                                    //   decoration:

                                    //    BoxDecoration(
                                    //     image: DecorationImage(
                                    //       fit: BoxFit.cover,
                                    //       image: NetworkImage(
                                    //         images[index]['src']["tiny"],
                                    //       ),
                                    //     ),
                                    //     color: Colors.green,
                                    //     borderRadius: BorderRadius.circular(20),
                                    //     border: const Border(
                                    //       top: BorderSide(
                                    //           width: 4,
                                    //           color: Colors.white,
                                    //           style:
                                    //               BorderStyle.solid), //BorderSide
                                    //       bottom: BorderSide(
                                    //           width: 4,
                                    //           color: Colors.white,
                                    //           style:
                                    //               BorderStyle.solid), //BorderSide
                                    //       left: BorderSide(
                                    //           width: 4,
                                    //           color: Colors.white,
                                    //           style:
                                    //               BorderStyle.solid), //Borderside
                                    //       right: BorderSide(
                                    //           width: 4,
                                    //           color: Colors.white,
                                    //           style:
                                    //               BorderStyle.solid), //BorderSide
                                    //     ),
                                    //   ),
                                    //   child: LoadingAnimationWidget.flickr(
                                    //     leftDotColor: Colors.red,
                                    //     rightDotColor: Colors.black,
                                    //     size: 25,
                                    //   ),
                                    // ),
                                    child:
                                     CachedNetworkImage(
                                      imageUrl: homeController
                                          .photos[index].urls!['thumb']!,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) => Center(
                                        child: LoadingAnimationWidget
                                            .stretchedDots(
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
                                  ),
                                ),
                              );
                            },
                            childCount: homeController.photos.length,
                          ),
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

class SimpelUiController extends GetxController {
  RxBool isLoading = true.obs;
}

// import 'package:flutter/material.dart';

// class AdvancedSliverAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             const SliverPersistentHeader(
//               delegate: CustomSliverAppBarDelegate(expandedHeight: 200),
//               pinned: true,
//             ),
//             buildImages(),
//           ],
//         ),
//       );

//   Widget buildImages() => SliverGrid(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         delegate: SliverChildBuilderDelegate(
//           (context, index) => ImageWidget(index: index),
//           childCount: 20,
//         ),
//       );
// }

// class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;

//   const CustomSliverAppBarDelegate({
//     required this.expandedHeight,
//   });

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     final size = 60;
//     final top = expandedHeight - shrinkOffset - size / 2;

//     return Stack(
//       fit: StackFit.expand,
//       //overflow: Overflow.visible,
//       children: [
//         buildBackground(shrinkOffset),
//         buildAppBar(shrinkOffset),
//         Positioned(
//           top: top,
//           left: 20,
//           right: 20,
//           child: buildFloating(shrinkOffset),
//         ),
//       ],
//     );
//   }

//   double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

//   double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

//   Widget buildAppBar(double shrinkOffset) => Opacity(
//         opacity: appear(shrinkOffset),
//         child: AppBar(
//           title: Text('jkv'),
//           centerTitle: true,
//         ),
//       );

//   Widget buildBackground(double shrinkOffset) => Opacity(
//         opacity: disappear(shrinkOffset),
//         child: Image.network(
//           'https://source.unsplash.com/random?mono+dark',
//           fit: BoxFit.cover,
//         ),
//       );

//   Widget buildFloating(double shrinkOffset) => Opacity(
//         opacity: disappear(shrinkOffset),
//         child: Card(
//           child: Row(
//             children: [
//               Expanded(child: buildButton(text: 'Share', icon: Icons.share)),
//               Expanded(child: buildButton(text: 'Like', icon: Icons.thumb_up)),
//               SizedBox(
//                 height: 10,
//               )
//             ],
//           ),
//         ),
//       );

//   Widget buildButton({
//     required String text,
//     required IconData icon,
//   }) =>
//       TextButton(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon),
//             const SizedBox(width: 12),
//             Text(text, style: TextStyle(fontSize: 20)),
//           ],
//         ),
//         onPressed: () {},
//       );

//   @override
//   double get maxExtent => expandedHeight;

//   @override
//   double get minExtent => kToolbarHeight + 30;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
// }

// class ImageWidget extends StatelessWidget {
//   final int index;

//   const ImageWidget({Key? key, required this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Container(
//         height: 150,
//         width: double.infinity,
//         child: Card(
//           child: Image.network(
//             'https://source.unsplash.com/random?sig=$index',
//             fit: BoxFit.cover,
//           ),
//         ),
//       );
// }
