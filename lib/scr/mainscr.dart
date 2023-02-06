// import 'package:card_swiper/card_swiper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class MainScr extends StatefulWidget {
//   MainScr({Key? key}) : super(key: key);

//   @override
//   State<MainScr> createState() => _MainScrState();
// }

// class _MainScrState extends State<MainScr> {
//   int count = 0;

//   List<String> list = [
//     'assets/n1.jpg',
//     'assets/n2.jpg',
//     'assets/n4.jpg',
//     'assets/n3.png',
//   ];

//   void Imagen() {
//     setState(() {
//       list.add(list[count % 3]);
//       ++count;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               margin: const EdgeInsets.all(10),
//               //padding: EdgeInsets.all(20),
//               height: 100,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                   color: Colors.orange,
//                   borderRadius:
//                       BorderRadius.only(bottomLeft: Radius.circular(50))),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 20,
//               ),
//               child: Column(
//                 children: [
//                   const Text('promo today'),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     padding: EdgeInsets.zero,
//                     height: 200,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         AspectRatio(
//                           aspectRatio: 2.6 / 3,
//                           child: Container(
//                             margin: const EdgeInsets.only(right: 15),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 image: const DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: AssetImage('assets/n4.jpg'))),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.bottomRight,
//                                   colors: [
//                                     Colors.black.withOpacity(.9),
//                                     Colors.black.withOpacity(.1),
//                                   ],
//                                 ),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                           ),
//                         ),
//                         AspectRatio(
//                           aspectRatio: 2.6 / 3,
//                           child: Container(
//                             margin: const EdgeInsets.only(right: 15),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 image: const DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: AssetImage('assets/n1.jpg'))),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.bottomRight,
//                                   stops: [0.2, 0.5],
//                                   colors: [
//                                     Colors.tealAccent.withOpacity(.3),
//                                     Colors.black.withOpacity(.1),
//                                   ],
//                                 ),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                           ),
//                         ),
//                         AspectRatio(
//                           aspectRatio: 2.6 / 3,
//                           child: Container(
//                             margin: const EdgeInsets.only(right: 15),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 image: const DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: AssetImage('assets/n2.jpg'))),
//                           ),
//                         ),
//                         AspectRatio(
//                           aspectRatio: 2.6 / 3,
//                           child: Container(
//                             margin: const EdgeInsets.only(right: 15),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 image: const DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: AssetImage('assets/n5.jpg'))),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Container(
//                 decoration:
//                     BoxDecoration(borderRadius: BorderRadius.circular(200)),
//                 width: double.infinity,
//                 margin: const EdgeInsets.all(20),
//                 height: 200,
//                 child: Swiper(
//                   itemCount: 4,
//                   itemBuilder: (BuildContext context, int index) {
//                     //const AssetImage('assets/n4.png');
//                     return Image.asset(
//                       list[index],
//                       fit: BoxFit.cover,
//                     );
//                   },
//                   customLayoutOption:
//                       CustomLayoutOption(startIndex: -1, stateCount: 3),
//                   pagination: const SwiperPagination(),
//                   viewportFraction: 0.3,
//                   layout: SwiperLayout.STACK,
//                   itemWidth: 400,
//                   autoplay: true,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(200)),
//               width: double.infinity,
//               margin: const EdgeInsets.all(20),
//               height: 200,
//               child: Swiper(
//                 itemCount: 4,
//                 itemBuilder: (BuildContext context, int index) {
//                   //const AssetImage('assets/n4.png');
//                   return Image.asset(
//                     list[index],
//                     fit: BoxFit.cover,
//                   );
//                 },
//                 customLayoutOption:
//                     CustomLayoutOption(startIndex: -1, stateCount: 3),
//                 pagination: const SwiperPagination(),
//                 viewportFraction: 0.3,
//                 layout: SwiperLayout.STACK,
//                 itemWidth: 400,
//                 autoplay: true,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 40,
//               padding: const EdgeInsets.all(20),
//               margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 gradient: const LinearGradient(
//                   colors: [Colors.green, Colors.teal, Colors.blueGrey],
//                   begin: Alignment.topLeft,
//                   stops: [5, 9],
//                 ),
//               ),
//               child: const Text(
//                 'Popular Books',
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w700,
//                   fontStyle: FontStyle.italic,
//                   letterSpacing: 2.0,
//                   wordSpacing: 2.0,
//                   backgroundColor: Colors.orangeAccent,
//                 ),
//               ),
//             ),
//             ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.blueGrey,
//                   backgroundImage: const AssetImage('assets/n5.jpg'),
//                   foregroundImage: const AssetImage('assets/n2.jpg'),
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Press',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.blueGrey,
//                   backgroundImage: const AssetImage('assets/n5.jpg'),
//                   foregroundImage: const AssetImage('assets/n2.jpg'),
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Press',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.blueGrey,
//                   backgroundImage: const AssetImage('assets/n5.jpg'),
//                   foregroundImage: const AssetImage('assets/n2.jpg'),
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Press',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.blueGrey,
//                   backgroundImage: const AssetImage('assets/n5.jpg'),
//                   foregroundImage: const AssetImage('assets/n1.jpg'),
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Press',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.blueGrey,
//                   backgroundImage: const AssetImage('assets/n5.jpg'),
//                   foregroundImage: const AssetImage('assets/taz.png'),
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Press',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.blueGrey,
//                   backgroundImage: const AssetImage('assets/n5.jpg'),
//                   foregroundImage: const AssetImage('assets/n2.jpg'),
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Press',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             CircleAvatar(
//               backgroundColor: Colors.blue,
//               foregroundColor: Colors.blueGrey,
//               backgroundImage: const AssetImage('assets/n5.jpg'),
//               foregroundImage: const AssetImage('assets/n2.jpg'),
//               child: ElevatedButton(
//                 onPressed: () {},
//                 child: const Text(
//                   'Press',
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Cs extends StatefulWidget {
 

  @override
  State<Cs> createState() => _CsState();
}

class _CsState extends State<Cs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 138, 153),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.pink),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
