import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebaseapp/json/homejson.dart';
import 'package:firebaseapp/jsonfo/jsonfile.dart';
import 'package:firebaseapp/wallss/picmodel.dart';
import 'package:firebaseapp/wallss/servies/catrgories.dart';
import 'package:firebaseapp/wallss/servies/fullscreen.dart';
import 'package:firebaseapp/wallss/servies/wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Frame extends StatefulWidget {
  const Frame({Key? key}) : super(key: key);

  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  int count = 0;
  List<String> list = [
    'Nature',
    'Wallpaper',
    'Nature',
    'Nature',
    'Nature',
    'Nature',
    'Nature',
    'Nature',
  ];

  void Imagen() {
    setState(() {
      list.add(list[count % 3]);
      ++count;
    });
  }

  List<CategorieModel> categories = [];

  List<PicModel> model = [];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>const  City(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          // height: double.infinity,
          height: 90,
          margin: const EdgeInsets.symmetric(horizontal: 1),
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 12,
                );
              },
              itemCount: continueWatching.length,
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctx, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FullScreen(imageurl: galasy[index]),
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 128,
                        width: 133,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //color: Colors.white.withOpacity(0.2),
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 215, 1, 1),
                              Colors.blue,
                              Colors.orange,
                              Color.fromARGB(255, 255, 106, 7)
                            ])),
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
                            imageUrl: continueWatching[index]['imageUrl'],
                            //imageUrl: categories[index].imgUrl.toString(),
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
                                  child:
                                      LoadingAnimationWidget.threeArchedCircle(
                                          color: Colors.cyan, size: 40),
                                )),
                          ),
                        ),
                      ),
                      Center(
                          child: Text(
                        continueWatching[index]['name'],
                        // categories[index].categorieName.toString(),
                        style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class Screnn {}

List<dynamic> Screen = [
  'Nature',
  'Wallpaper',
  'Nature',
  'Nature',
  'Nature',
  'Nature',
  'Nature',
  'Nature',
];
/*
Container(
      height: 100,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          scrollDirection: Axis.horizontal,
          itemCount: sliders.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Screnn()));
                // setState(() {
                //   Imagen();
                // });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: sliders[index],
                        // imageBuilder: ((context, imageProvider) => Container(
                        //       decoration: BoxDecoration(
                        //         image: DecorationImage(
                        //           image: imageProvider,
                        //           fit: BoxFit.cover,
                        //         ),
                        //       ),
                        //     )
                        //     ),
                        placeholder: (context, url) => Center(
                          child: LoadingAnimationWidget.threeArchedCircle(
                            color: Colors.cyan,
                            size: 30,
                          ),
                        ),
                      ),
                      // Text(
                      //   text[index],
                      //   style: const TextStyle(
                    ), //       color: Colors.green, fontSize: 19),
                    // ),
                  ],
                ),
              ),
            );
          }),
    );
*/
