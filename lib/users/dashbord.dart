// import 'dart:ffi';

// import 'dart:html';

import 'package:firebaseapp/drawer/drawer.dart';
import 'package:firebaseapp/users/profile.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int count = 0;

  List<String> list = [
    'assets/n1.jpg',
    'assets/n2.jpg',
    'assets/n4.jpg',
    'assets/n3.png',
  ];

  void Imagen() {
    setState(() {
      list.add(list[count % 3]);
      ++count;
    });
  }

  final Controller = PageController();
  static const String imageURL =
      'https://mocah.org/thumbs/268085-wallpaper-1080-2400.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 3.0,
        centerTitle: true,
        brightness: Brightness.light,
        title: const Text(
          "My First App",
          style:
              TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w700
                  //fontSize: 29,
                  ),
        ),
      ),

      backgroundColor: Colors.tealAccent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.teal,
                      blurRadius: 12,
                      spreadRadius: 13,
                      offset: Offset(-1, 0))
                ],
              ),
              child: ListView(
                itemExtent: 12,
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.white70,
                    backgroundColor: Colors.tealAccent,
                    backgroundImage: const AssetImage('assets/n2.jpg'),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const CircleAvatar(
                        backgroundColor: Colors.orange,
                        backgroundImage: AssetImage(
                          'assets/n3.png',
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    foregroundColor: Colors.white70,
                    backgroundColor: Colors.tealAccent,
                    backgroundImage: const AssetImage('assets/n2.jpg'),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const CircleAvatar(
                        backgroundColor: Colors.orange,
                        backgroundImage: AssetImage(
                          'assets/n3.png',
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    foregroundColor: Colors.white70,
                    backgroundColor: Colors.tealAccent,
                    backgroundImage: const AssetImage('assets/n2.jpg'),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const CircleAvatar(
                        backgroundColor: Colors.orange,
                        backgroundImage: AssetImage(
                          'assets/n3.png',
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    foregroundColor: Colors.white70,
                    backgroundColor: Colors.tealAccent,
                    backgroundImage: const AssetImage('assets/n2.jpg'),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const CircleAvatar(
                        backgroundColor: Colors.orange,
                        backgroundImage: AssetImage(
                          'assets/n3.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.green,
                  Colors.teal,
                  Colors.cyan,
                ]),
                //color: Colors.orange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                      )),
                  const Text(
                    'jack nd',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'This is about the structure of the page',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  const Text('promo today'),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        AspectRatio(
                          aspectRatio: 2.6 / 3,
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/n4.jpg'),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.holiday_village)),
                                  const Text(
                                    "New Books",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              )),
                        ),
                        AspectRatio(
                          aspectRatio: 2.6 / 3,
                          child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/n1.jpg'),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  stops: const [0.2, 0.5],
                                  colors: [
                                    Colors.tealAccent.withOpacity(.3),
                                    Colors.black.withOpacity(.1),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 2.6 / 3,
                          child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/n2.jpg'),
                              ),
                            ),
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 2.6 / 3,
                          child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/n5.jpg'),
                              ),
                            ),
                          ),
                        ),
                      ],
                   ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                height: 200,
                child: Swiper(
                  itemCount: 4,
                  itemHeight: 300,
                  itemBuilder: (BuildContext context, int index) {
                    //const AssetImage('assets/n4.png');
                    return Image.asset(
                      list[index],
                      fit: BoxFit.cover,
                    );
                  },
                  customLayoutOption:
                      CustomLayoutOption(startIndex: -1, stateCount: 3),
                  pagination: const SwiperPagination(),
                  viewportFraction: 0.3,
                  layout: SwiperLayout.TINDER,
                  itemWidth: 400,
                  autoplay: true,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              height: 200,
              child: Swiper(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  //const AssetImage('assets/n4.png');
                  return Image.asset(
                    list[index],
                    fit: BoxFit.cover,
                  );
                },
                customLayoutOption:
                    CustomLayoutOption(startIndex: -1, stateCount: 3),
                pagination: const SwiperPagination(),
                viewportFraction: 0.3,
                layout: SwiperLayout.STACK,
                itemWidth: 400,
                autoplay: true,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white60,
                  gradient: LinearGradient(colors: [
                    Colors.greenAccent,
                    Colors.blue,
                    Colors.purple
                  ])),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              width: 350,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage: const AssetImage('assets/u.png'),
                        maxRadius: 28,
                        backgroundColor: Colors.black,
                        child: ElevatedButton(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          onPressed: (() {}),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(500, 800),
                            shape: const CircleBorder(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/u.png',
                                fit: BoxFit.cover,
                                width: 300,
                                height: 30,
                              ),
                             
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        maxRadius: 28,
                        backgroundColor: Colors.black,
                        child: ElevatedButton(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          onPressed: (() {}),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(500, 800),
                            shape: const CircleBorder(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/go.png',
                                width: 200,
                                height: 30,
                                fit: BoxFit.fitHeight,
                              ),
                              // Icon(
                              //   Icons.facebook,
                              //   color: Colors.black,
                              // ),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.black,
                        child: ElevatedButton(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          onPressed: (() {}),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(1000, 1000),
                            shape: const CircleBorder(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.home,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.black,
                        child: ElevatedButton(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          onPressed: (() {}),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(1000, 1000),
                            shape: const CircleBorder(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.search,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.black,
                        child: ElevatedButton(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          onPressed: (() {}),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(500, 800),
                            shape: const CircleBorder(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/n.png'),
                              const Icon(
                                Icons.home,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.black,
                        child: ElevatedButton(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          onPressed: (() {}),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(500, 800),
                            shape: const CircleBorder(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/n.png'),
                              const Icon(
                                Icons.facebook,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.black,
                        child: ElevatedButton(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          onPressed: (() {}),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(1000, 1000),
                            shape: const CircleBorder(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.home,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.black,
                        child: ElevatedButton(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          onPressed: (() {}),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(1000, 1000),
                            shape: const CircleBorder(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.person,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:card_swiper/card_swiper.dart';
// import 'package:flutter/material.dart';

// class Dashboard extends StatefulWidget {
  

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   int count = 0;

//   List<String> list = [
//     'assets/n1.jpg',
//     'assets/n2.jpg',
//     'assets/n4.jpg',
//     'assets/n3.png',
//     //'assets/n6.jpg',
//     // 'assets/n7.jpg',
//     // 'assets/n16.jpg',
//     // 'assets/n8.jpg',
//     // 'assets/n9.jpg',
//     // 'assets/n11.jpg',
//     // 'assets/n12.jpg',
//   ];

//   void Imagen() {
//     setState(() {
//       list.add(list[count % 3]);
//       ++count;
//     });
//   }

//   final Controller = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.person,
//                 color: Colors.black,
//                 size: 28,
//               ),
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: SafeArea(
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Text(
//                   'Popular Books',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 0,
//                 ),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Container(
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(200),
//                     ),
//                     width: double.infinity,
//                     margin: const EdgeInsets.all(10),
//                     height: 200,
//                     child: Swiper(
//                       itemCount: 4,
//                       itemHeight: 300,
//                       itemBuilder: (BuildContext context, int index) {
//                         //const AssetImage('assets/n4.png');
//                         return Image.asset(
//                           scale: 1.0,
//                           list[index],
//                           fit: BoxFit.cover,
//                         );
//                       },
//                       customLayoutOption:
//                           CustomLayoutOption(startIndex: -1, stateCount: 3),
//                       pagination: const SwiperPagination(),
//                       viewportFraction: 0.3,
//                       layout: SwiperLayout.CUSTOM,
//                       itemWidth: 400,
//                       //autoplay: true,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 // Container(
//                 //   decoration: BoxDecoration(
//                 //     borderRadius: BorderRadius.circular(200),
//                 //   ),
//                 //   width: double.infinity,
//                 //   margin: const EdgeInsets.all(20),
//                 //   height: 200,
//                 //   child: Swiper(
//                 //     itemCount: 4,
//                 //     itemBuilder: (BuildContext context, int index) {
//                 //       //const AssetImage('assets/n4.png');
//                 //       return Image.asset(
//                 //         list[index],
//                 //         fit: BoxFit.cover,
//                 //       );
//                 //     },
//                 //     customLayoutOption:
//                 //         CustomLayoutOption(startIndex: -1, stateCount: 3),
//                 //     pagination: const SwiperPagination(),
//                 //     viewportFraction: 0.3,
//                 //     layout: SwiperLayout.STACK,
//                 //     itemWidth: 400,
//                 //     autoplay: true,
//                 //   ),
//                 // ),
//                 Container(
//                   padding: EdgeInsets.zero,
//                   height: 200,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       AspectRatio(
//                         aspectRatio: 2.6 / 3,
//                         child: Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             margin: const EdgeInsets.only(right: 15),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               image: const DecorationImage(
//                                 fit: BoxFit.fill,
//                                 image: AssetImage('assets/n4.jpg'),
//                               ),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 IconButton(
//                                     onPressed: () {},
//                                     icon: const Icon(Icons.holiday_village)),
//                                 const Text(
//                                   "New Books",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       fontStyle: FontStyle.italic),
//                                 )
//                               ],
//                             )),
//                       ),
//                       AspectRatio(
//                         aspectRatio: 2.6 / 3,
//                         child: Container(
//                           margin: const EdgeInsets.only(right: 15),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             image: const DecorationImage(
//                               fit: BoxFit.cover,
//                               image: AssetImage('assets/n1.jpg'),
//                             ),
//                           ),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.bottomRight,
//                                 stops: const [0.2, 0.5],
//                                 colors: [
//                                   Colors.tealAccent.withOpacity(.3),
//                                   Colors.black.withOpacity(.1),
//                                 ],
//                               ),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//                         ),
//                       ),
//                       AspectRatio(
//                         aspectRatio: 2.6 / 3,
//                         child: Container(
//                           margin: const EdgeInsets.only(right: 15),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             image: const DecorationImage(
//                               fit: BoxFit.cover,
//                               image: AssetImage('assets/n2.jpg'),
//                             ),
//                           ),
//                         ),
//                       ),
//                       AspectRatio(
//                         aspectRatio: 2.6 / 3,
//                         child: Container(
//                           margin: const EdgeInsets.only(right: 15),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             image: const DecorationImage(
//                               fit: BoxFit.cover,
//                               image: AssetImage('assets/n5.jpg'),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
