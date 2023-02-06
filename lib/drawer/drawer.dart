import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseapp/authontication/anmitedsp.dart';
import 'package:firebaseapp/authontication/googlesign.dart';
import 'package:firebaseapp/authontication/loginui.dart';
import 'package:firebaseapp/authontication/mnpage.dart';
import 'package:firebaseapp/connectivity/internetcon.dart';
import 'package:firebaseapp/nav/spotify.dart';
import 'package:firebaseapp/socialSite/amazon.dart';
import 'package:firebaseapp/socialSite/telegram.dart';
import 'package:firebaseapp/tab.dart';
import 'package:firebaseapp/widdg/loading.dart';
import 'package:firebaseapp/widgets.dart/container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/authontication/login_page.dart';
import 'package:firebaseapp/authontication/spalash.dart';
import 'package:firebaseapp/nav/flipkart.dart';
import 'package:firebaseapp/nav/google.dart';
import 'package:firebaseapp/nav/map.dart';
import 'package:firebaseapp/scr/musicacc.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../authontication/newlogin.dart';
import '../authontication/privacy.dart';
import '../authontication/usermodel.dart';
import '../socialSite/facebook.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late File _image;
  File? imageFile;
  // User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  bool isLoding = false;
  @override
  void initState() {
    super.initState();
    //uploadData();
//checkValues();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image = (await ImagePicker.platform.pickImage(source: ImageSource.camera))
          as File;
    } else {
      image = (await ImagePicker.platform
          .pickImage(source: ImageSource.gallery)) as File;
    }
    setState(() {
      _image = image;
    });
  }

  final firstName = FirebaseAuth.instance.currentUser!.displayName;
  final photo = FirebaseAuth.instance.currentUser!.photoURL;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;
  User? user = FirebaseAuth.instance.currentUser;
  verifyEmail() async {
    if (user != null && user!.emailVerified) {
      await user!.sendEmailVerification();
      print('Verification Email has been sent');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          'Verification Email has been sent',
          style: TextStyle(fontSize: 18, color: Colors.amber),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.black,
      backgroundColor: Colors.black,
      //backgroundColor: HexColor('#AE8625'),
      // backgroundColor: Colors.black,
      child: Container(
        decoration: const BoxDecoration(color: Colors.black
//color: Colors.white.withAlpha(100),
            // gradient: LinearGradient(
            //   colors: [
            //     // Colors.blue,
            //     // Color.fromARGB(255, 94, 0, 157),
            //     // Colors.cyanAccent,
            //   ],
            // )
            //color: Color.fromARGB(255, 7, 215, 234),
            // color: HexColor('#AE8625')
            // image: DecorationImage(
            //   fit: BoxFit.cover,
            //   image: AssetImage(
            //     'assets/n13.jpg',
            //   ),
            // ),
            ),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [
                //     Colors.blue,
                //     Colors.cyan,
                //     Colors.teal,
                //     Colors.limeAccent
                //   ],
                // ),
                border: Border.all(color: Colors.white10.withAlpha(80)),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withAlpha(100),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                  ),
                ],

                color: Colors.white.withOpacity(0.2),
                //color: Colors.white.withOpacity(0.2),
              ),
              // decoration: BoxDecoration(
              //   color: Colors.white.withOpacity(0.2),
              //   borderRadius: BorderRadius.all(Radius.circular(20)),
              //   // gradient: LinearGradient(
              //   //   colors: [
              //   //     Color.fromARGB(255, 108, 249, 0),
              //   //     Colors.cyan,
              //   //     Colors.teal,
              //   //     Colors.limeAccent
              //   //   ],
              //   // ),
              // ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              child: Center(
                child: Text(
                  'CREATED BY PAWAN(ND)',
                  style: GoogleFonts.dancingScript(
                      color: Colors.black87,
                      //color: Colors.white.withOpacity(0.2),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // createHeader(),
            // Profilepage(),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10),
            //   //  padding: EdgeInsets.fromLTRB(7, 10, 0, 0),
            //   child: Text(
            //     'For You',
            //     style: TextStyle(
            //       color: Colors.green,
            //       fontSize: 18,
            //     ),
            //   ),
            // ),
            // const Padding(
            //   padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            //   child: Divider(
            //     color: Colors.black,
            //     thickness: 1,
            //   ),
            // ),
            // createDrawerItem(
            //   // icon: Icons.home,
            //   FontAwesomeIcons: FontAwesomeIcons.file,
            //   text: 'Camera',
            //   onTap: () {
            //     getImage(true);
            //   },
            //   //  _image = null? Container(): Image.file(_image);
            // ),
            // createDrawerItem(
            //   icon: Icons.photo,
            //   FontAwesomeIcons: FontAwesomeIcons.photoFilm,
            //   text: 'Photos',
            //   onTap: () {
            //     getImage(false);
            //     // Navigator.push(context, MaterialPageRoute (builder: (context)=>))
            //   },
            // ),
            createHeader(),
            // createDrawerItem(
            //   FontAwesomeIcons: FontAwesomeIcons.phone,
            //   icon: Icons.contacts,
            //   text: 'Phone Call',
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const Contactsde()));
            //   },
            // ),
            //  createDrawerItem(
            //   FontAwesomeIcons: FontAwesomeIcons.phone,
            //   icon: Icons.contacts,
            //   text: 'Phone Call',
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const Contactsde()));
            //   },
            // ),

            // createDrawerItem(
            //   text: 'Music',
            //   onTap: () {
            //     Navigator.of(context).push(_music());
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //     builder: (context) =>
            //     //         const MyHomePage(title: 'Music For you'),
            //     //   ),
            //     // );
            //   },
            //   FontAwesomeIcons: FontAwesomeIcons.music,
            // ),

            // const Padding(
            //   padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            //   child: Divider(
            //     color: Colors.black,
            //     thickness: 1,
            //   ),
            // ),
            const Padding(
              padding: EdgeInsets.fromLTRB(7, 10, 0, 0),
            ),
            createDrawerItem(
              //icon: Icons.youtube_searched_for,

              text: 'Amazon',
              onTap: () {
                Navigator.of(context).push((_Amozan()));
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => isLoding
                //             ? Center(
                //                 child: LoadingAnimationWidget.threeArchedCircle(
                //                     color: Colors.cyan, size: 30))
                //             : AmazonScr()));
              },
              FontAwesomeIcons: FontAwesomeIcons.amazon,
            ),

            createDrawerItem(
              icon: Icons.flip_to_back,
              text: 'Flipkart',
              onTap: () {
                Navigator.of(context).push((_flipkart()));
              },
              FontAwesomeIcons: FontAwesomeIcons.flipboard,
            ),

            createDrawerItem(
              text: 'Facebook',
              onTap: () {
                Navigator.of(context).push(_facebook());
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => isLoding
                //             ? Center(
                //                 child: LoadingAnimationWidget.threeArchedCircle(
                //                   color: Colors.cyan,
                //                   size: 30,
                //                 ),
                //               )
                //             : const Facebook()));
              },
              //icon: ,
              FontAwesomeIcons: FontAwesomeIcons.facebook,
            ),
            createDrawerItem(
              FontAwesomeIcons: FontAwesomeIcons.spotify,
              text: 'Spotify',
              onTap: () {
                // Future.delayed(const Duration(milliseconds: 150), () {
                //   return const Center(
                //       child: CircularProgressIndicator(
                //     color: Colors.amber,
                //   ));
                // }).then((value) {
                //   return Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => const Spotify()));
                // });
                // FutureBuilder(
                //   future: Future.delayed(const Duration(milliseconds: 150))
                //       .then((value) {
                //     return const CircularProgressIndicator(
                //       color: Colors.green,
                //     );
                //   }),
                //   builder: (context, snapshot) {
                //     return GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const Spotify()));
                //       },
                //     );
                //   },
                // );
                Navigator.of(context).push(_spotify());

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const Spotify()));
                // Navigator.push(context, MaterialPageRoute (builder: (context)=>))
              },
            ),

            createDrawerItem(
              FontAwesomeIcons: FontAwesomeIcons.telegram,
              text: 'Telegram',
              onTap: () {
                Navigator.of(context).push(_telegram());
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => isLoding
                //         ? Center(
                //             child: LoadingAnimationWidget.threeArchedCircle(
                //               color: Colors.cyan,
                //               size: 30,
                //             ),
                //           )
                //         : Telegram(),
                //   ),
                // );
                // Navigator.push(context, MaterialPageRoute (builder: (context)=>))
              },
            ),
            createDrawerItem(
              icon: Icons.videocam,
              text: 'Share with Friends',
              onTap: () {
                Share.share('https://www.bing.com/?pc=W037&DPC=BG00');
                // Navigator.push(context, MaterialPageRoute (builder: (context)=>))
              },
              FontAwesomeIcons: FontAwesomeIcons.share,
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 25, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.privacy_tip,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(_privacy());
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         PolicyDialog(mdFileName: 'privacy_policy.md'),
                      //   ),
                      // );
                    },
                    child: Text(
                      'Privacy & Security',
                      style: GoogleFonts.adventPro(
                        color: Colors.white,
                        fontSize: 19,
                        textStyle: const TextStyle(
                          // color: Colors.green,
                          color: Color.fromARGB(255, 3, 39, 239),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
            createDrawerItem(
              icon: Icons.logout,
              text: 'Log Out',
              onTap: () async {
                showAnimatedDialog(
                  // barrierColor: Colors.amber,
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      positiveText: 'OK',
                      negativeTextStyle:
                          GoogleFonts.amiko(color: Colors.cyan, fontSize: 20),
                      positiveTextStyle:
                          GoogleFonts.amiko(color: Colors.red, fontSize: 20),
                      titleText: 'Sign out',
                      contentText: 'Do you wanna sign out',
                      onPositiveClick: () {
                        GoogleSignIn().disconnect();
                        FirebaseAuth.instance.signOut();
                        // Navigator.of(context).pop();
                        Fluttertoast.showToast(
                          fontSize: 23,
                          msg: 'logout successfull',
                          backgroundColor: Colors.black,
                          textColor: Colors.amber,
                        );
                        Navigator.of(context).push(_logout());
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => isLoding
                        //           ? Center(
                        //               child: LoadingAnimationWidget
                        //                   .threeArchedCircle(
                        //                 color: Colors.cyan,
                        //                 size: 30,
                        //               ),
                        //             )
                        //           : LoginPage(),
                        //     ),
                        //     (route) => false);
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();

                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => isLoding
                        //           ? Center(
                        //               child: LoadingAnimationWidget
                        //                   .threeArchedCircle(
                        //                 color: Colors.cyan,
                        //                 size: 30,
                        //               ),
                        //             )
                        //           : MyTabs(),
                        //     ),
                        //     (route) => false);
                      },
                    );
                  },
                  animationType: DialogTransitionType.size,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
                // await FirebaseAuth.instance.signOut();
                //final provider = Provider.of(context, listen: false);
                //await FirebaseAuth.instance.signOut();
                // ignore: use_build_context_synchronously

                //  Navigator.push(context, MaterialPageRoute (builder: (context)=>))
              },
              FontAwesomeIcons: FontAwesomeIcons.signOut,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      //padding: EdgeInsets.all(0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(19)),
        // image: DecorationImage(
        //   filterQuality: FilterQuality.high,
        //   fit: BoxFit.fill,

        // ),
      ),
      child: Container(
        height: 70,

        // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.blue,
          //     Colors.cyan,
          //     Colors.teal,
          //     Colors.limeAccent
          //   ],
          // ),
          border: Border.all(color: Colors.white10.withAlpha(80)),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withAlpha(100),
              blurRadius: 10.0,
              spreadRadius: 0.0,
            ),
          ],
          //   color: Colors.white.withOpacity(0.2),
          color: Colors.white.withOpacity(0.2),
        ),
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                      ),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            // gradient: const LinearGradient(
                            //   colors: [
                            //     Colors.blue,
                            //     Colors.yellow,
                            //     Colors.cyan,
                            //     Colors.redAccent
                            //   ],
                            // ),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3)),
                        child: Container(
                            height: 83,
                            width: 83,
                            decoration: BoxDecoration(
                              // gradient: const LinearGradient(
                              //   colors: [
                              //     Colors.blue,
                              //     Colors.yellow,
                              //     Colors.cyan,
                              //     Colors.redAccent
                              //   ],
                              // ),
                              // shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.black, width: 2.0),
                              color: Colors.white,

                              shape: BoxShape.circle,
                              // image: const DecorationImage(
                              //   fit: BoxFit.cover,
                              //   image: AssetImage('assets/n16.jpg'),
                              // ),

                              // image: DecorationImage(
                              //   fit: BoxFit.cover,

                              // image: NetworkImage(
                              //    photo!= null?

                              //   ),
                              // image: AssetImage('assets/n16.jpg'),
                              // ),
                            ),
                            child: (photo != null)
                                ? Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            photo!,
                                          ), //Selected Image
                                          fit: BoxFit.fill),
                                    ),
                                  )
                                : GestureDetector(
                                    child: const Icon(
                                      Icons.image,
                                      color: Colors.black,
                                    ),
                                    onTap: () {
                                      showAnimatedDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        animationType:
                                            DialogTransitionType.size,
                                        curve: Curves.fastOutSlowIn,
                                        duration: const Duration(seconds: 1),
                                        builder: (BuildContext context) {
                                          return ClassicGeneralDialogWidget(
                                            positiveText: 'OKAY',
                                            negativeText: 'OKAY',
                                            negativeTextStyle:
                                                GoogleFonts.amiko(
                                                    color: Colors.teal,
                                                    fontSize: 20),
                                            positiveTextStyle:
                                                GoogleFonts.amiko(
                                                    color: Colors.red,
                                                    fontSize: 20),
                                            titleText: 'SORRY!',
                                            contentText:
                                                'This feature is not currently available',
                                            onNegativeClick: () {
                                              Navigator.of(context).pop();
                                            },
                                          );
                                        },
                                      );
                                    },
                                  )),
                      ),
                      // child: CircleAvatar(
                      //   backgroundColor: Colors.green,
                      //   radius: 40,
                      //   child: Image(image: NetworkImage(photo!)),
                      // ),
                    ),
                    const SizedBox(
                      width: 1.8,
                    ),
                    Text(
                      // if(loggedInUser == true){
                      //   "$firstName",
                      // }else if{
                      //   "$firstName";
                      // }

                      // FirebaseAuth.instance.currentUser!.displayName
                      //     .toString(),
                      // '$displayname',
                      // if(loggedInUser==true){
                      "${loggedInUser.firstName ?? '$firstName'}",
                      // }
                      // else if{
                      //  "$firstName";
                      // }
                      style: GoogleFonts.blinker(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                  width: 2,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                  child: Row(
                    children: [
                      Text('$email',
                          style: GoogleFonts.blinker(
                              color: Colors.black,
                              fontSize: 14.8,
                              fontWeight: FontWeight.bold)
                          //style: const TextStyle(
                          //   fontSize: 19,
                          //   fontWeight: FontWeight.bold,
                          //   color: Colors.black,
                          // ),
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // Stack(
      //   children: const <Widget>[
      //     Positioned(
      //       bottom: 10.0,
      //       left: 24.0,
      //       child: Text(
      //         "JACKND",
      //         style: TextStyle(
      //           color: Color.fromARGB(255, 11, 26, 230),
      //           fontSize: 30.0,
      //           fontWeight: FontWeight.w500,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Widget createDrawerItem(
      {FontAwesomeIcons,
      IconData? icon,
      required String text,
      required GestureTapCallback onTap}) {
    //  @required IconData icon;
    return ListTile(
      title: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Icon(
              FontAwesomeIcons,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Text(
              text,
              style: GoogleFonts.adventPro(
                color: Colors.white,
                fontSize: 19,
                textStyle: const TextStyle(
                  // color: Colors.green,
                  color: Color.fromARGB(255, 3, 39, 239),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Route _Amozan() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => AmazonScr(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _flipkart() {
    setState(() {
      isLoding = true;
    });
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          isLoding ? const Loading() : const Flipkart(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _facebook() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Facebook(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _spotify() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Spotify(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _telegram() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Telegram(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _sharewidth() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PolicyDialog(
        mdFileName: '',
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _privacy() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PolicyDialog(
        mdFileName: 'privacy_policy.md',
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _logout() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => isLoding
          ? const Center(
              child: CircularProgressIndicator(color: Colors.cyan),
            )
          : const MLoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _music() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const AmazonScr(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class Profilepage extends StatefulWidget {
  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // gradient: const LinearGradient(
          //   colors: [
          //     Colors.green,
          //     Colors.cyan,
          //     Colors.blue,
          //     Colors.orange,
          //   ],
          // ),
          color: Colors.white.withOpacity(0.6),
        ),
        child: Stack(
          children: [
            CircleAvatar(),
          ],
        ),
      ),
    );
  }
}
