import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/authontication/forget_pass.dart';

import 'package:firebaseapp/authontication/googlesign.dart';

import 'package:firebaseapp/authontication/signUp.dart';
import 'package:firebaseapp/scr/videoplayer.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:firebaseapp/tab.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

import 'package:sign_in_button/sign_in_button.dart';
import 'package:video_player/video_player.dart';

class TsClip3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2, size.height - 100);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}

// class TsClip2 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height - 100);
//     path.lineTo(size.width / 2, size.height);
//     path.lineTo(size.width, size.height - 100);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     throw UnimplementedError();
//   }
// }

// class TsClip1 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height);
//     path.quadraticBezierTo(
//         size.width / 2, size.height - 200, size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     throw UnimplementedError();
//   }
// }

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obsureText = true;
  bool _secondsecure = true;
  // Future<User?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser != null) {
  //       final GoogleSignInAuthentication googleAuth =
  //           await googleUser.authentication;
  //       final credential = GoogleAuthProvider.credential(
  //           accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //       UserCredential userCredential =
  //           await FirebaseAuth.signInWithCredential(credential);
  //       return userCredential.user;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  late bool isLoding = false;
  final _formKey = GlobalKey<FormState>();
  var email = " ";
  var password = " ";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  userLogin() async {
    isLoding = true;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                // showDialog(
                //   context: context,
                //   builder: (ctx) => AlertDialog(
                //     title: Text("Show Alert Dialog Box"),
                //     content: Text("You have raised a Alert Dialog Box"),
                //   ),
                // ),
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
      // await FirebaseAuth.instance
      //     .signInWithEmailAndPassword(email: email, password: password);
      // // ignore: use_build_context_synchronously
      // Navigator.pushReplacement(
      //   ////
      //   context,
      //   MaterialPageRoute(

      //     builder: (context) => MyTabs(),
      //   ),
      // );
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
//     void _signInFacebook() async {
// //    2407536649-ZFNGnaMhK7tCHBYL4rQ2SGT9nkuTbnL8g3aJCxq acc token
// //    Niz5D73o0BaUMZU4GHHGCTSpJmIoxmoPIITPeuOH46SMO acc token secret
//     FacebookLogin facebookLogin = FacebookLogin();

//     final result = await facebookLogin.logIn(['email']);
//     final token = result.accessToken.token;
//     final graphResponse = await http.get(
//         'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name&access_token=${token}');
//     print(graphResponse.body);
//     if (result.status == FacebookLoginStatus.loggedIn) {
//       final credential = FacebookAuthProvider.getCredential(accessToken: token);
//       _auth.signInWithCredential(credential);
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          // VideoWidget(
          //   controller: VideoPlayerController.asset('assets/live.mp4'),
          // ),
          Form(
            // key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: ListView(
                children: [
                  // ClipPath(
                  //   clipper: TsClip1(),
                  //   child: Container(
                  //     width: double.infinity,
                  //     height: 500,
                  //     color: Colors.amberAccent,
                  //   ),
                  // ),
                  // ClipPath(
                  //     clipper: TsClip1(),
                  //     child: Container(
                  //       height: 50,
                  //       decoration: const BoxDecoration(
                  //         borderRadius: BorderRadius.all(Radius.circular(30)),
                  //         color: Colors.red,
                  //         image: DecorationImage(
                  //           fit: BoxFit.cover,
                  //           image: AssetImage('assets/nd2.jpg'),
                  //         ),
                  //       ),
                  //     )),
                  // ClipPath(
                  //   clipper: TsClip2(),
                  //   child: Container(
                  //     width: double.infinity,
                  //     height: 400,
                  //     color: Colors.redAccent,
                  //   ),
                  // ),
                  ClipPath(
                    clipper: TsClip3(),
                    child: Container(
                      width: double.infinity,
                      height: 230,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/nat.png')
                            //   NetworkImage(
                            //       "https://images.pexels.com/photos/1086584/pexels-photo-1086584.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2g"),
                            ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 70),
                  //   child: Lottie.network(
                  //     'https://assets1.lottiefiles.com/packages/lf20_2jbzmbru.json',
                  //     height: 200.0,
                  //     repeat: true,
                  //     reverse: true,
                  //     animate: true,
                  //   ),
                  // ),
                  // Container(
                  //   width: 40,
                  //   height: 250,
                  //   decoration: const BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(30)),
                  //     image: DecorationImage(
                  //       filterQuality: FilterQuality.low,
                  //       fit: BoxFit.fill,
                  //       image: AssetImage('assets/n12.jpg'),
                  //     ),
                  //     gradient: LinearGradient(
                  //       colors: [
                  //         Colors.teal,
                  //         Colors.tealAccent,
                  //         Colors.blueAccent
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  // TextFormField(
                  //      cursorWidth: 4.0,

                  //     style: const TextStyle(
                  //         color: Colors.white70, fontSize: 20),
                  //     cursorColor: Colors.greenAccent,
                  //     autofocus: false,
                  //     decoration: const InputDecoration(
                  //       labelText: 'Email',
                  //       prefixIcon: Icon(Icons.email),
                  //       labelStyle: TextStyle(fontSize: 20),
                  //       border: OutlineInputBorder(),
                  //       errorStyle:
                  //           TextStyle(color: Colors.orange, fontSize: 15),
                  //     ),
                  //     controller: emailController,
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'Pleae entr email';
                  //       } else if (!value.contains('@')) {
                  //         return 'please enter valid email';
                  //       }
                  //       return null;
                  //     },
                  //   ),],
                  // ),
                  TextFormField(
                    cursorWidth: 2.0,
                    style: const TextStyle(color: Colors.white70, fontSize: 20),
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
                      labelStyle: TextStyle(fontSize: 20, color: Colors.cyan),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.red, fontSize: 15),
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
                  ),
                  const SizedBox(
                    height: 10,
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
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ElevatedButton(
                        //   onPressed: () {
                        //     if (_formKey.currentState!.validate()) {
                        //       setState(() {
                        //         email = emailController.text;
                        //         password = passwordController.text;
                        //       });
                        //     }
                        //     userLogin();
                        //   },
                        //   child: const Text(
                        //     'Login',
                        //     style: TextStyle(fontSize: 12),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            // if (_formKey.currentState!.validate()) {
                            //   setState(() {
                            //     email = emailController.text.trim();
                            //     password = passwordController.text.trim();
                            //   });
                            // }
                            setState(() {
                              email = emailController.text.trim();
                              password = passwordController.text.trim();
                            });
                            userLogin();
                          },
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
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont have an account ?',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, a, b) => SignUp(),
                                transitionDuration: const Duration(seconds: 0),
                              ),
                            );
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.amberAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: SignInButton(Buttons.google,
                        text: "SignIn with google", onPressed: () {
                      isLoding
                          ? const CircularProgressIndicator(
                              color: Colors.cyan,
                              strokeWidth: 30,
                            )
                          : signup(context);
                      // signup(context);
                      // const CircularProgressIndicator(
                      //   color: Colors.green,
                      //   strokeWidth: 9,
                      // );
                      // // if (AuthService().signInWithGoogle() == true) {
                      // //   return MyTabs();
                      // // }
                      // FutureBuilder(
                      //   builder: ((context, snapshot) {
                      //     if (snapshot.hasError) {
                      //       return Text('Error initializing Firebase');
                      //     } else if (snapshot.connectionState ==
                      //         ConnectionState.done) {
                      //       return signup( context);
                      //     }
                      //   }),
                      // );
                      // FutureBuilder(
                      //   future: AuthCredential.initializeFirebase(
                      //       context: context),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasError) {
                      //       return Text('Error initializing Firebase');
                      //     } else if (snapshot.connectionState ==
                      //         ConnectionState.done) {
                      //       return signup(context);
                      //     }
                      //     return const CircularProgressIndicator();
                      //   },
                      // );
                    }),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 5, horizontal: 20),
                  //   child: SignInButton(Buttons.facebook,
                  //       text: "Continue with Facebook", onPressed: () {}),
                  // ),

                  // const SizedBox(height: 20),
                  // ClipPath(
                  //   clipper: MultipleRoundedCurveClipper(),
                  //   child: Container(
                  //     height: 60,
                  //     width: 60,
                  //     color: Colors.pink,
                  //     child: const Center(
                  //         child: Text(
                  //       "WELCOME",
                  //       style: TextStyle(
                  //           fontSize: 20, fontWeight: FontWeight.bold),
                  //     )),
                  //   ),
                  // ),
                  // ClipPath(
                  //   clipper: HexagonalClipper(reverse: true),
                  //   child: Container(
                  //     height: 50,
                  //     color: Colors.orangeAccent,
                  //     child: Center(
                  //         child: Text("HexagonalClipper(reverse: true)")),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}

// class SingUp {
//   // function to implement the google signin

// // creating firebase instance
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   SingUp(BuildContext context);

//   Future<void> signup(BuildContext context) async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;
//       final AuthCredential authCredential = GoogleAuthProvider.credential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken);

//       // Getting users credential
//       UserCredential result = await auth.signInWithCredential(authCredential);
//       User? user = result.user;

//       if (result != null) {
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => LoginPage()));
//       } // if result not null we simply call the MaterialpageRoute,
//       // for go to the HomePage screen
//     }
//   }
//}

// function to implement the google signin

// creating firebase instance
// final FirebaseAuth auth = FirebaseAuth.instance;

// Future<void> signup(BuildContext context) async {
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   if (googleSignInAccount != null) {
//     final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;
//     final AuthCredential authCredential = GoogleAuthProvider.credential(
//         idToken: googleSignInAuthentication.idToken,
//         accessToken: googleSignInAuthentication.accessToken);

//     // Getting users credential
//     UserCredential result = await auth.signInWithCredential(authCredential);
//     User? user = result.user;

//     if (result != null) {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => LoginPage()));
//     } // if result not null we simply call the MaterialpageRoute,
//     // for go to the HomePage screen
  //  }
//}
