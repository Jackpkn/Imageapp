import 'dart:convert';

import 'package:firebaseapp/wallss/servies/fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Nature extends StatefulWidget {
  const Nature({Key? key}) : super(key: key);

  @override
  State<Nature> createState() => _NatureState();
}

class _NatureState extends State<Nature> {
  late List nature = [];
  late String _filename;
  late bool isLoading = false;
  // @override
  // void initState() {
  //   super.initState();
  // }
  List images = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    // fetchapi();
    getImage();
  }

  fetchapi() async {
    isLoading = true;
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers: {
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

  getImage() async {
    isLoading = true;
    await http
        .get(Uri.parse(
            'https://api.unsplash.com/search/photos?per_page=80&client_id=LOspW8jcT27D-PLY4mFR22Hj9DIiKIkEbefVyeM3gZ8&query=motivation'))
        .then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        nature = result['results'];
      });
      isLoading = false;
    });

    return 'SUCCESS';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.horizontalRotatingDots(
                  // leftDotColor: Colors.black,
                  // rightDotColor: Colors.red,
                  color: Colors.cyan,
                  size: 30,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        //color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridView.builder(
                          itemCount: nature.length,
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
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => FullScreen(
                                //       imageurl: nature[index]['src']['large2x'],
                                //     ),
                                //   ),
                                // );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FullScreen(
                                      imageurl: nature[index]['urls']['small'],
                                    ),
                                  ),
                                );
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      nature[index]['urls']["small"],
                                    ),
                                  ),
                                  color: Colors.green,
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
                  InkWell(
                    hoverColor: Colors.green,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        width: 120,
                        color: Colors.black,
                        child: const Center(
                          child: Text(
                            'load More',
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
