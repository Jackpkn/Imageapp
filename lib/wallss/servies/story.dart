import 'package:firebaseapp/json/homejson.dart';
import 'package:firebaseapp/jsonfo/storyjson.dart';
import 'package:firebaseapp/wallss/servies/wallpaper.dart';
import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(stories.length, (index) {
              return Padding(
                padding: EdgeInsets.only(left: 10, top: 1),
                child: Column(
                  children: [
                    Container(
                      width: 68,
                      height: 68,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 215, 1, 1),
                            Colors.blue,
                            Color.fromARGB(255, 90, 255, 7),
                            Color.fromARGB(255, 244, 7, 220),
                          ])
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
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Sunset()));
                          }),
                          child: Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 2),
                              image: DecorationImage(
                                image: NetworkImage(stories[index]['img']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          stories[index]['name'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
