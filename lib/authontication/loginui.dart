import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/authontication/googlesign.dart';
import 'package:firebaseapp/authontication/login_page.dart';
import 'package:firebaseapp/scr/videoplayer.dart';
import 'package:firebaseapp/tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in_button/sign_in_button.dart';

class GoogleLogin extends StatefulWidget {
  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;
  late bool isLoding = false;
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            VideoWidget(
              controller: VideoPlayerController.asset('assets/live.mp4'),
            ),
            Form(
                child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 90, horizontal: 10),
                  child: Container(
                    height: 210,
                    width: 200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/sec.webp'),
                      ),
                    ),
                    // child: Padding(
                    //   padding: const EdgeInsets.only(
                    //       top: 120, bottom: 20, left: 20, right: 20),
                    //   child: Text(
                    //     'Chekflk msk ',
                    //     style: TextStyle(color: Colors.amber),
                    //   ),
                    // ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: ClipPath(
                //     clipper: TsClip3(),
                //     child: Container(
                //       width: double.infinity,
                //       height: 260,
                //       decoration: const BoxDecoration(
                //         image: DecorationImage(
                //             image: AssetImage('assets/nat.png')
                //             //   NetworkImage(
                //             //       "https://images.pexels.com/photos/1086584/pexels-photo-1086584.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2g"),
                //             ),
                //       ),
                //     ),
                //   ),
                // ),
                Center(
                  child: Container(
                    height: 120,
                    child: Text(
                      'Welcome Back!',
                      style: GoogleFonts.dancingScript(
                          fontSize: 43,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 90),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SignInButton(
                    Buttons.google,
                    text: 'SignIn with Google',
                    onPressed: () {
                      isLoding
                          ? const CircularProgressIndicator(
                              color: Colors.cyan,
                            )
                          : signup(context);
                    },
                  ),
                )
              ],
            ))
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: SignInButton(
            //     Buttons.google,
            //     text: 'SignIn with Google',
            //     onPressed: () {
            //       isLoding
            //           ? const CircularProgressIndicator(
            //               color: Colors.cyan,
            //             )
            //           : signup(context);
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  
}
