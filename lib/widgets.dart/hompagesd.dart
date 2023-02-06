import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebaseapp/json/homejson.dart';
import 'package:firebaseapp/quots/qotos.dart';
import 'package:flutter/material.dart';

class Dart extends StatefulWidget {
  @override
  State<Dart> createState() => _DartState();
}

class _DartState extends State<Dart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          aspectRatio: 2.0,
          viewportFraction: 0.93,
        ),
        items: List.generate(sliders.length, (index) {
          return GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => NewPage(
              //       imageUrl: sliders[index],
              //     ),
              //   ),
              // );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => PlayBackSpeedExamplePage(),
              //   ),
              // );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // image: DecorationImage(
                  //   image: NetworkImage(
                  //     quotesList[index][kAuthor],
                  //   ),
                  // ),
                ),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/n15.jpg'),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              child: Text(
                                quotesList[index][kAuthor],
                              ),
                            ),
                          ),
                          Text(
                            quotesList[index][kQuote],
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          );
        }),
      ),
    );
  }
}
