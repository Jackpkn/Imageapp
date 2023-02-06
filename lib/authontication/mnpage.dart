import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/authontication/forget_pass.dart';

import 'package:firebaseapp/authontication/googlesign.dart';

import 'package:firebaseapp/authontication/signUp.dart';
import 'package:firebaseapp/models/ads_provider.dart';
import 'package:firebaseapp/scr/videoplayer.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:firebaseapp/tab.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'package:sign_in_button/sign_in_button.dart';
import 'package:video_player/video_player.dart';

class Loginanother extends StatefulWidget {
  Loginanother({Key? key}) : super(key: key);

  @override
  State<Loginanother> createState() => _LoginanotherState();
}

class _LoginanotherState extends State<Loginanother> {
  bool _obsureText = true;

  late bool isLoding = false;
  final _formKey = GlobalKey<FormState>();
  var email = " ";
  var password = " ";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  userLogin() async {
    isLoding = true;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Fluttertoast.showToast(
                  fontSize: 25,
                  toastLength: Toast.LENGTH_LONG,
                  msg: 'Login Successful',
                  textColor: Colors.black,
                  backgroundColor: Colors.amber,
                ),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MyTabs()))
              });

      isLoding = false;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        print('No user found for that email');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blueGrey,
            content: Text(
              'No user found for that email',
              style: TextStyle(fontSize: 18, color: Colors.amber),
            ),
          ),
        );
      } else if (error.code == 'wrong-password') {
        print('wrong password provided by the user');
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VideoWidget(
            controller: VideoPlayerController.asset('assets/live.mp4'),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 00,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Form(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  child: ListView(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: TextFormField(
                          cursorWidth: 2.0,
                          style: const TextStyle(
                              color: Colors.green, fontSize: 20),
                          cursorColor: Colors.black,
                          autofocus: false,
                          decoration: const InputDecoration(
                            focusColor: Colors.blue,
                            hintText: 'Email',
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.amberAccent,
                            ),
                            labelStyle:
                                TextStyle(fontSize: 20, color: Colors.cyan),
                            border: OutlineInputBorder(),
                            errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Pleae Enter email';
                            } else if (!value.contains('@')) {
                              return 'Please Enter valid email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      focusColor: Colors.white,
                      child: TextFormField(
                        autofocus: false,
                        obscureText: _obsureText,
                        cursorColor: Colors.black,
                        cursorWidth: 2.0,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Password',
                          prefixIcon: const Icon(
                            Icons.vpn_key,
                            color: Colors.amberAccent,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obsureText = !_obsureText;
                              });
                            },
                            child: Icon(
                              _obsureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.amberAccent,
                              size: 30,
                            ),
                          ),
                          labelStyle:
                              const TextStyle(fontSize: 20, color: Colors.cyan),
                          border: const OutlineInputBorder(),
                          errorStyle:
                              const TextStyle(color: Colors.red, fontSize: 15),
                        ),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter password';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          passwordController.text = newValue!;
                        },
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10),
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(15),
                    //     child: TextFormField(
                    //       cursorWidth: 2.0,
                    //       style: const TextStyle(
                    //           color: Colors.white70, fontSize: 20),
                    //       cursorColor: Colors.black,
                    //       autofocus: false,
                    //       decoration: InputDecoration(
                    //         suffixIcon: GestureDetector(
                    //           onTap: () {
                    //             setState(() {
                    //               _obsureText = !_obsureText;
                    //             });
                    //           },
                    //           child: Icon(
                    //             _obsureText
                    //                 ? Icons.visibility
                    //                 : Icons.visibility_off,
                    //             color: Colors.amberAccent,
                    //             size: 30,
                    //           ),
                    //         ),
                    //         focusColor: Colors.blue,
                    //         hintText: 'Fill the password',
                    //         labelText: 'Password',
                    //         prefixIcon: Icon(
                    //           Icons.vpn_key,
                    //           color: Colors.amberAccent,
                    //         ),
                    //         labelStyle:
                    //             TextStyle(fontSize: 20, color: Colors.cyan),
                    //         border: OutlineInputBorder(),
                    //         errorStyle:
                    //             TextStyle(color: Colors.red, fontSize: 15),
                    //       ),
                    //       controller: passwordController,
                    //       validator: (value) {
                    //         if (value == null || value.isEmpty) {
                    //           return 'Please Enter password';
                    //         }
                    //         return null;
                    //       },
                    //       onSaved: (newValue) {
                    //         passwordController.text = newValue!;
                    //       },
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 0,
                    ),
                    // Center(
                    //   child: Container(
                    //     margin: EdgeInsets.zero,
                    //     height: 90,
                    //     child: Text(
                    //       'Welcome Back!',
                    //       style: GoogleFonts.dancingScript(
                    //           fontSize: 50,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.white),
                    //     ),
                    //   ),
                    // ),
                    isLoding
                        ? CircularProgressIndicator()
                        : GestureDetector(
                            onTap: () async {
                              setState(() {
                                isLoding = true;
                              });
                              signIn(emailController.text,
                                  passwordController.text);
                              setState(() {
                                isLoding = false;
                              });
                            },
                            // onTap: () {
                            //   if (_formKey.currentState!.validate()) {
                            //     setState(() {
                            //       email = emailController.text.trim();
                            //       password = passwordController.text.trim();
                            //     });
                            //   }
                            //   // setState(() {
                            //   //   email = emailController.text.trim();
                            //   //   password = passwordController.text.trim();
                            //   // });
                            //   userLogin();
                            // },
                            child: Container(
                              height: 44,
                              width: 85,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.green,
                                    Colors.cyan,
                                    Colors.blue
                                  ],
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetPass(),
                          ),
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ForgetPass(),
                            ),
                          );
                        },
                        child: const Text(
                          'forget password ?',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.amberAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     ElevatedButton(
                    //       onPressed: () {
                    //         if (_formKey.currentState!.validate()) {
                    //           setState(() {
                    //             email = emailController.text.trim();
                    //             password = passwordController.text.trim();
                    //           });
                    //         }
                    //         userLogin();
                    //       },
                    //       child: Container(
                    //         height: 44,
                    //         width: 85,
                    //         decoration: BoxDecoration(
                    //           color: Colors.green,
                    //           borderRadius: BorderRadius.circular(20),
                    //           gradient: const LinearGradient(
                    //             colors: [
                    //               Colors.green,
                    //               Colors.cyan,
                    //               Colors.blue
                    //             ],
                    //           ),
                    //         ),
                    //         child: const Center(
                    //           child: Text(
                    //             'Login',
                    //             style: TextStyle(
                    //               fontSize: 20,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),  TextButton(
                    //       onPressed: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => ForgetPass(),
                    //           ),
                    //         );
                    //       },
                    //       child: GestureDetector(
                    //         onTap: () {
                    //           Navigator.of(context).push(
                    //             MaterialPageRoute(
                    //               builder: (context) => ForgetPass(),
                    //             ),
                    //           );
                    //         },
                    //         child: const Text(
                    //           'forget password ?',
                    //           style: TextStyle(
                    //             fontSize: 15,
                    //             color: Colors.amberAccent,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(vertical: 2),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       const Text(
                    //         'Dont have an account ?',
                    //         style: TextStyle(
                    //             fontSize: 18,
                    //             color: Colors.black,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //       TextButton(
                    //         onPressed: () {
                    //           Navigator.pushReplacement(
                    //             context,
                    //             PageRouteBuilder(
                    //               pageBuilder: (context, a, b) => SignUp(),
                    //               transitionDuration:
                    //                   const Duration(seconds: 0),
                    //             ),
                    //           );
                    //         },
                    //         child: const Text(
                    //           "SignUp",
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 20,
                    //               color: Colors.amberAccent),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    isLoding
                        ? const CircularProgressIndicator(
                            color: Colors.cyan,
                          )
                        : Container(
                            decoration: BoxDecoration(
                                // color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: SignInButton(Buttons.google,
                                padding: const EdgeInsets.all(8),
                                elevation: 4.0,
                                text: "SignIn with Google",
                                onPressed: () async {
                              setState(() {
                                isLoding = true;
                              });
                              signup(context);
                              setState(() {
                                isLoding = false;
                              });
                            }),
                          ),
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar:
      //     Consumer<AdProvider>(builder: (context, adProvider, child) {
      //   if (adProvider.isLoginsce) {
      //     Container(
      //       height: adProvider.homePageBanner.size.height.toDouble(),
      //       child: AdWidget(ad: adProvider.homePageBanner),
      //     );
      //   } else {
      //     return Container(
      //       height: 0,
      //     );
      //   }
      //   return Container(
      //     height: 0,
      //   );
      // }),
    );
  }

  void signIn(String email, String password) async {
    setState(() {
      isLoding = true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyTabs())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
    setState(() {
      isLoding = false;
    });
  }
}
