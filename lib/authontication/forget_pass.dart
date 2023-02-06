import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/authontication/login_page.dart';
import 'package:firebaseapp/authontication/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

import 'newlogin.dart';

class ForgetPass extends StatefulWidget {
  ForgetPass({Key? key}) : super(key: key);

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final _formKey = GlobalKey<FormState>();
  var email = " ";
  final emailController = TextEditingController();

  resetPassword() async {
    // showDialog(
    //   context: context,
    //   builder: (context) => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Password Reset email has been sent !',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MLoginPage(),
        ),
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        print('No user found that email');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Password Reset email has been sent !',
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MLoginPage(),
          ),
        );
      }
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
   
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Reset Password"),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //       icon: Icon(Icons.back_hand))
        // ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.red,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/n15.jpg'),
                      ),
                    ),
                    //   decoration: const BoxDecoration(
                    //     borderRadius: BorderRadius.all(Radius.circular(30)),
                    //     image: DecorationImage(
                    //       filterQuality: FilterQuality.low,
                    //       fit: BoxFit.fill,
                    //       image: AssetImage('assets/n12.jpg'),
                    //     ),
                    height: 600,
                    width: double.infinity,
                    //child: Center(child: Text("")),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.green,
                                Colors.cyan,
                                Colors.blue,
                              ],
                            ),
                          ),
                          margin: const EdgeInsets.only(top: 20),
                          child: const Text(
                            'Reset link will be send to your email ID !',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              autofocus: false,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email';
                                } else if (!value.contains('@')) {
                                  return 'Please enter valid email';
                                }
                                return null;
                              },
                              // validator: (email) =>
                              //     email != null && !EmailValidator.validate(email)
                              //         ? 'Enter a valid email'
                              //         : null,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // sendpasswordresetemail(email);
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      email = emailController.text;
                                    });
                                    resetPassword();
                                  }
                                },
                                child: const Text(
                                  'Send Email',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MLoginPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Do not have an account ?",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, a, b) =>
                                            SignUp(),
                                        transitionDuration:
                                            const Duration(seconds: 0),
                                      ),
                                      (route) => false);
                                },
                                child: const Text(
                                  'SignUp',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   decoration: const BoxDecoration(
              //     gradient: LinearGradient(
              //       colors: [
              //         Colors.green,
              //         Colors.cyan,
              //         Colors.blue,
              //       ],
              //     ),
              //   ),
              //   margin: const EdgeInsets.only(top: 20),
              //   child: const Text(
              //     'Reset link will be send to your email ID !',
              //     style: TextStyle(fontSize: 20, color: Colors.black),
              //   ),
              // ),
              // Expanded(
              //   child: Form(
              //     key: _formKey,
              //     child: Padding(
              //       padding:
              //           const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              //       child: ListView(
              //         children: [
              //           Container(
              //             margin: const EdgeInsets.symmetric(vertical: 10),
              //             child: TextFormField(
              //               autofocus: false,
              //               decoration: const InputDecoration(
              //                 labelText: 'Email',
              //                 labelStyle:
              //                     TextStyle(color: Colors.black, fontSize: 15),
              //               ),
              //               controller: emailController,
              //               validator: (value) {
              //                 if (value == null || value.isEmpty) {
              //                   return 'Please enter email';
              //                 } else if (!value.contains('@')) {
              //                   return 'Please enter valid email';
              //                 }
              //                 return null;
              //               },
              // validator: (email) =>
              //     email != null && !EmailValidator.validate(email)
              //         ? 'Enter a valid email'
              //         : null,
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.symmetric(vertical: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       ElevatedButton(
              //         onPressed: () {
              //           if (_formKey.currentState!.validate()) {
              //             setState(() {
              //               email = emailController.text;
              //             });
              //             resetPassword();
              //           }
              //           ;
              //         },
              //         child: const Text(
              //           'Send Email',
              //           style: TextStyle(fontSize: 18),
              //         ),
              //       ),
              //       TextButton(
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => LoginPage(),
              //             ),
              //           );
              //         },
              //         child: const Text(
              //           'Login',
              //           style: TextStyle(fontSize: 13),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.zero,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const Text("Do not have an account ?"),
              //       TextButton(
              //           onPressed: () {
              //             Navigator.pushAndRemoveUntil(
              //                 context,
              //                 PageRouteBuilder(
              //                   pageBuilder: (context, a, b) => SignUp(),
              //                   transitionDuration:
              //                       const Duration(seconds: 0),
              //                 ),
              //                 (route) => false);
              //           },
              //           child: const Text('SignUp'))
              //     ],
              //   ),
              // )
              //  ],
              // ),
              // ),
              //  ),
              //),
            ],
          ),
        ),
      ),
    );
  }

  // Future resetsPassword() async {
  //   showDialog(
  //     context: context,
  //     builder: (context) => Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  //   try {
  //     await FirebaseAuth.instance
  //         .sendPasswordResetEmail(email: emailController.text.trim());
  //     Utils.showSnackBar('password reset email sent');
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //     Utils.showSnackBar(e.message);
  //     Navigator.of(context).pop();
  //   }
  // }
}
