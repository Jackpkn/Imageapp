import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:share/share.dart';
import 'package:glass/glass.dart';

class ShareBox extends StatefulWidget {
  const ShareBox({Key? key}) : super(key: key);
  @override
  State<ShareBox> createState() => _ShareBoxState();
}

class _ShareBoxState extends State<ShareBox> {
  bool isLoadin = false;
  @override
  Widget build(BuildContext context) {
    return isLoadin
        ? Center(
            child: LoadingAnimationWidget.threeArchedCircle(
                color: Colors.green, size: 30),
          )
        : Container(
            height: 169,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              // color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(14),
              // color: HexColor("#D4AF37"),
              gradient: const LinearGradient(
                colors: [
                  Colors.teal,
                  Colors.green,
                  Colors.cyan,
                  //  Colors.black,
                  // HexColor("#D4AF37"),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: const Text(
                    'Follow US',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Share.share('www.linkedin.com/in/pawan-jack-a381b7232');
                      },
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.green,
                                spreadRadius: 2.0,
                                blurRadius: 2.0)
                          ],
                          image: const DecorationImage(
                              image: AssetImage('assets/linked.png'),
                              fit: BoxFit.cover),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(25),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/insta.png'),
                              fit: BoxFit.cover),
                          color: const Color.fromRGBO(76, 175, 80, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 54,
                        padding: const EdgeInsets.all(25),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Share.share('https://twitter.com/jack_pkn28');
                      },
                      child: Container(
                        //height: 52,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.green,
                                spreadRadius: 2.0,
                                blurRadius: 2.0)
                          ],
                          image: const DecorationImage(
                            image: AssetImage('assets/twitter.jpg'),
                            fit: BoxFit.cover,
                          ),
                          color: const Color.fromARGB(255, 2, 37, 234),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 50,
                        padding: const EdgeInsets.all(25),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                      ),
                    ),
                    GestureDetector(
                      onTap: (() {
                        Share.share(
                            'https://youtube.com/channel/UCW4B4aZp5oRYRx5YeZr4dug');
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.green,
                                spreadRadius: 2.0,
                                blurRadius: 2.0)
                          ],
                          image: const DecorationImage(
                            image: AssetImage('assets/youtube.png'),
                            fit: BoxFit.cover,
                          ),
                          color: const Color.fromRGBO(76, 175, 80, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 50,
                        padding: const EdgeInsets.all(25),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.green,
                              spreadRadius: 2.0,
                              blurRadius: 2.0)
                        ],
                        image: const DecorationImage(
                          image: AssetImage('assets/fb.png'),
                          fit: BoxFit.cover,
                        ),
                        color: const Color.fromRGBO(76, 175, 80, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      padding: const EdgeInsets.all(25),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                    ),
                    // GestureDetector(
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       boxShadow: const [
                    //         BoxShadow(
                    //             color: Colors.green,
                    //             spreadRadius: 2.0,
                    //             blurRadius: 2.0)
                    //       ],
                    //       image: const DecorationImage(
                    //         image: AssetImage('assets/pint.png'),
                    //         fit: BoxFit.cover,
                    //       ),
                    //       color: const Color.fromRGBO(76, 175, 80, 1),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     height: 50,
                    //     padding: const EdgeInsets.all(25),
                    //     margin: const EdgeInsets.symmetric(
                    //         horizontal: 14, vertical: 10),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          );
  }
}



// Container(
//   decoration: BoxDecoration(
//     border: Border.all(color: Colors.white10.withAlpha(80)),
//     borderRadius: BorderRadius.circular(20),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.white.withAlpha(100),
//         blurRadius: 10.0,
//         spreadRadius: 0.0,
//       ),
//     ],
//     color: Colors.white.withOpacity(0.2),
//   ),
//);


// import 'package:flutter/material.dart';

// import 'dart:ui';

 

// import 'package:glassmorphism/glassmorphism.dart';

 

// class DemoApp extends StatelessWidget {

//   @override

//   Widget build(BuildContext context) {

//     return Scaffold(

//       body: Container(

//         height: MediaQuery.of(context).size.height,

//         width: MediaQuery.of(context).size.width,

//         decoration: BoxDecoration(

//             gradient: LinearGradient(colors: [

//           Color.fromRGBO(60, 32, 189, 0.91),

//           Color.fromRGBO(60, 38, 223, 0.71)

//         ], begin: Alignment.centerLeft, end: Alignment.centerRight)),

//         child: LayoutBuilder(

//           builder: (context, constraints) {

//             return Stack(

//               children: [

//                 Positioned(

//                     top: constraints.maxHeight * 0.3,

//                     left: constraints.maxWidth * 0.00,

//                     child: Container(

//                       height: constraints.maxHeight * 0.15,

//                       width: constraints.maxWidth * 0.35,

//                       decoration: BoxDecoration(

//                           gradient: RadialGradient(

//                             colors: [

//                               Color.fromRGBO(52, 64, 245, 1),

//                               Color.fromRGBO(44, 130, 177, 1)

//                             ],

//                             radius: 0.7,

//                           ),

//                           //color: Colors.red,

//                           shape: BoxShape.circle),

//                     )),

//                 Positioned(

//                     top: constraints.maxHeight * 0.55,

//                     right: constraints.maxWidth * 0.00,

//                     child: Container(

//                       height: constraints.maxHeight * 0.15,

//                       width: constraints.maxWidth * 0.35,

//                       decoration: BoxDecoration(

//                           gradient: RadialGradient(

//                             colors: [Colors.red, Colors.pink.withOpacity(0.5)],

//                             radius: 0.7,

//                           ),

//                           // color: Colors.red,

//                           shape: BoxShape.circle),

//                     )),

//                 Center(

//                   child: ClipRRect(

//                     borderRadius: BorderRadius.circular(10),

//                     child: GlassmorphicContainer(

//                       border: 1,

//                       blur: 5,

//                       borderRadius: 10,

//                       height: MediaQuery.of(context).size.height * 0.4,

//                       width: MediaQuery.of(context).size.width * 0.85,

//                       linearGradient: LinearGradient(colors: [

//                         Colors.white.withOpacity(0.2),

//                         Colors.white.withOpacity(0.05)

//                       ], begin: Alignment.topLeft, end: Alignment.bottomRight),

//                       borderGradient: LinearGradient(colors: [

//                         Colors.white.withOpacity(0.2),

//                         Colors.white.withOpacity(0.05)

//                       ], begin: Alignment.topLeft, end: Alignment.bottomRight),

//                       child: Container(

//                           decoration: BoxDecoration(

//                               border: Border.all(

//                                 color: Colors.white.withOpacity(0.3),

//                               ),

//                               borderRadius: BorderRadius.circular(10)),

//                           child: Column(

//                             mainAxisAlignment: MainAxisAlignment.center,

//                             children: [

//                               Text(

//                                 'WELCOME',

//                                 style: TextStyle(

//                                     color: Colors.white,

//                                     fontSize: 26,

//                                     letterSpacing: 0.5,

//                                     fontWeight: FontWeight.bold),

//                               ),

//                               SizedBox(

//                                 height: 20,

//                               ),

//                               Container(

//                                 margin: EdgeInsets.all(16),

//                                 child: Column(

//                                   children: [

//                                     TextFormField(

//                                       decoration: InputDecoration(

//                                         hintText: 'Email',

//                                         filled: true,

//                                         fillColor: Colors.white,

//                                         border: OutlineInputBorder(

//                                           borderRadius:

//                                               BorderRadius.circular(10),

//                                         ),

//                                         focusedBorder: OutlineInputBorder(

//                                           borderRadius:

//                                               BorderRadius.circular(10),

//                                         ),

//                                         enabledBorder: OutlineInputBorder(

//                                           borderRadius:

//                                               BorderRadius.circular(10),

//                                         ),

//                                       ),

//                                     ),

//                                     SizedBox(

//                                       height: 20,

//                                     ),

//                                     TextFormField(

//                                       decoration: InputDecoration(

//                                         hintText: 'Password',

//                                         filled: true,

//                                         fillColor: Colors.white,

//                                         border: OutlineInputBorder(

//                                           borderRadius:

//                                               BorderRadius.circular(10),

//                                         ),

//                                         focusedBorder: OutlineInputBorder(

//                                           borderRadius:

//                                               BorderRadius.circular(10),

//                                         ),

//                                         enabledBorder: OutlineInputBorder(

//                                           borderRadius:

//                                               BorderRadius.circular(10),

//                                         ),

//                                       ),

//                                     ),

//                                   ],

//                                 ),

//                               ),

//                               SizedBox(

//                                 height: 20,

//                               ),

//                               Container(

//                                 margin: EdgeInsets.only(right: 16),

//                                 alignment: Alignment.centerRight,

//                                 child: TextButton(

//                                     style: ButtonStyle(

//                                         backgroundColor:

//                                             MaterialStateProperty.all(

//                                                 Colors.purple)),

//                                     onPressed: () {},

//                                     child: Text(

//                                       'Log In',

//                                       style: TextStyle(color: Colors.white),

//                                     )),

//                               )

//                             ],

//                           )),

//                     ),

//                   ),

//                 )

//               ],

//             );

//           },

//         ),

//       ),

//     );

//   }

// }