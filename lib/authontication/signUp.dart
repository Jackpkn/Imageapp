// ignore_for_file: file_names
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseapp/authontication/mnpage.dart';
import 'package:firebaseapp/authontication/usermodel.dart';
import 'package:firebaseapp/scr/videoplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'newlogin.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  User? user = FirebaseAuth.instance.currentUser;
  File? _image;
  File? imageFile;
  final imagepicker = ImagePicker();
  // User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  late bool isLoding = false;
  String? downloadUrl;
  Future imagePickerMethod() async {
    final pick = await imagepicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        print('select image');
      }
    });
  }

  Future uploadImage() async {
    Reference ref = FirebaseStorage.instance.ref().child('images');
    await ref.putFile(_image!);
    downloadUrl = await ref.getDownloadURL();
    print(downloadUrl);
  }
//   @override
//   void initState() {
//     super.initState();
//     //uploadData();
// //checkValues();
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(user!.uid)
//         .get()
//         .then((value) {
//       loggedInUser = UserModel.fromMap(value.data());
//       setState(() {});
//     });
//   }

  // void selectImage(ImageSource source) async {
  //   XFile? pickedFile = await ImagePicker().pickImage(source: source);

  //   if (pickedFile != null) {
  //     cropImage(pickedFile);
  //   }
  // }

  // void cropImage(XFile file) async {
  //   Future<CroppedFile?> croppedImage = ImageCropper().cropImage(
  //       sourcePath: file.path,
  //       //aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
  //       compressQuality: 20);

  //   if (croppedImage != null) {
  //     setState(() {
  //       imageFile = croppedImage as File?;
  //     });
  //   }
  // }

  bool _obsureText = true;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  var first = '';
  var second = '';
  var email = " ";
  var password = " ";
  var confirmpassword = " ";
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpassController.dispose();
    super.dispose();
  }

  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpassController = TextEditingController();
  String? errorMessage;
  Future<void> resistration() async {
    if (password == confirmpassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        print(userCredential);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Registered Successfully. please Sign In',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Loginanother(),
          ),
        );
      } on FirebaseAuthException catch (error) {
        if (error.code == 'weak password') {
          print('Password is too weak');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Password is too weak',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        } else if (error.code == 'email-already-in-use') {
          print('Account is already exists');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Account is already exists',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      }
    } else {
      print('password and confirm password does not match');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'password and confirm password does not match',
            style: TextStyle(fontSize: 20, color: Colors.amberAccent),
          ),
        ),
      );
    }
  }

  // void showPhotoOptions() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: const Text("Upload Profile Picture"),
  //           content: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               ListTile(
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                   selectImage(ImageSource.gallery);
  //                 },
  //                 leading: const Icon(Icons.photo_album),
  //                 title: const Text("Select from Gallery"),
  //               ),
  //               ListTile(
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                   selectImage(ImageSource.camera);
  //                 },
  //                 leading: const Icon(Icons.camera_alt),
  //                 title: const Text("Take a photo"),
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }
  // ignore: non_constant_identifier_names
  bool SecondOBsecure = true;

  void uploadData() async {
    //UIHelper.showLoadingDialog(context, "Uploading image..");

    UploadTask uploadTask = FirebaseStorage.instance
        .ref("profile")
        .child(UserModel().profile.toString())
        .putFile(imageFile!);
    // taskSnapshot = await uploadTask.onComplete;
    TaskSnapshot snapshot = await uploadTask;
    UserModel userModel = UserModel();
    String? imageUrl = await snapshot.ref.getDownloadURL();

    userModel.profile = imageUrl;
  }
  // Stream builder is generally build for stream data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              VideoWidget(
                controller: VideoPlayerController.asset('assets/lives.mp4'),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: ClipPath(
                          //     clipper: Circle(circleId: 2.0),
                          //     child: Container(
                          //       decoration: const BoxDecoration(
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(30)),
                          //         color: Colors.red,
                          //         image: DecorationImage(
                          //           fit: BoxFit.cover,
                          //           image: AssetImage('assets/n14.jpg'),
                          //         ),
                          //       ),
                          //       //   decoration: const BoxDecoration(
                          //       //     borderRadius: BorderRadius.all(Radius.circular(30)),
                          //       //     image: DecorationImage(
                          //       //       filterQuality: FilterQuality.low,
                          //       //       fit: BoxFit.fill,
                          //       //       image: AssetImage('assets/n12.jpg'),
                          //       //     ),
                          //       height: 250,

                          //       //child: Center(child: Text("")),
                          //     ),
                          //   ),
                          // ),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     imagePickerMethod();
                          //   },
                          //   child: Text('select'),
                          // ),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     uploadData();
                          //   },
                          //   child: Text('upload'),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 10),
                          //   child: Lottie.network(
                          //     'https://assets1.lottiefiles.com/packages/lf20_2jbzmbru.json',
                          //     height: 200.0,
                          //     repeat: true,
                          //     reverse: true,
                          //     animate: true,
                          //   ),
                          // ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 27),
                            child: Container(
                              height: 127,
                              width: 127,
                              decoration: const BoxDecoration(
                                color: Colors.amber,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/userprofile.png'),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  showAnimatedDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    animationType: DialogTransitionType.size,
                                    curve: Curves.fastOutSlowIn,
                                    duration: const Duration(seconds: 1),
                                    builder: (BuildContext context) {
                                      return ClassicGeneralDialogWidget(
                                        positiveText: 'OKAY',
                                        negativeText: 'OKAY',
                                        negativeTextStyle: GoogleFonts.amiko(
                                            color: Colors.teal, fontSize: 20),
                                        positiveTextStyle: GoogleFonts.amiko(
                                            color: Colors.red, fontSize: 20),
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
                              ),
                            ),
                          ),
                          // CupertinoButton(
                          //   onPressed: () {
                          //     showPhotoOptions();
                          //   },
                          //   padding: EdgeInsets.all(0),
                          //   child: CircleAvatar(
                          //     radius: 60,
                          //     backgroundImage: (imageFile != null)
                          //         ? FileImage(imageFile!)
                          //         : null,
                          //     child: (imageFile == null)
                          //         ? const Icon(
                          //             Icons.person,
                          //             size: 60,
                          //           )
                          //         : null,
                          //   ),
                          // ),
                          // CupertinoButton(
                          //   onPressed: () {
                          //     selectImage(ImageSource.camera);
                          //   },
                          //   color: Theme.of(context).colorScheme.secondary,
                          //   child: const Text("Submit"),
                          // ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.2),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: TextFormField(
                              onSaved: ((value) {
                                firstNameEditingController.text = value!;
                              }),
                              autofocus: false,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.arrow_drop_down_circle,
                                  color: Colors.amberAccent,
                                ),
                                labelText: 'First Name',
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.cyan,
                                ),
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              controller: firstNameEditingController,
                              validator: (value) {
                                RegExp regex = RegExp(r'^.{3,}$');
                                if (value!.isEmpty) {
                                  return ("First name cannot be Empty");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Enter valid name(Min. 3 Character)");
                                }
                                return null;
                              },
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please enter Name';
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.2),
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: TextFormField(
                              onSaved: ((value) {
                                secondNameEditingController.text = value!;
                              }),
                              autofocus: false,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.arrow_drop_down_circle,
                                  color: Colors.amberAccent,
                                ),
                                labelText: 'Second Name',
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.cyan,
                                ),
                                border: OutlineInputBorder(),
                                errorStyle: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              controller: secondNameEditingController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ('Second name cannot be Empty');
                                }
                                return null;
                                // if (value == null || value.isEmpty) {
                                //   return 'Please enter Name';
                                // }
                                // return null;
                              },
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                  autofocus: false,
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.cyan,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.amberAccent,
                                    ),
                                    border: OutlineInputBorder(),
                                    errorStyle: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  controller: emailEditingController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter email';
                                    } else if (!value.contains('@')) {
                                      return 'Please Enter valid email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white.withOpacity(0.2),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                autofocus: false,
                                obscureText: _obsureText,
                                decoration: InputDecoration(
                                  labelText: 'Password',
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
                                  labelStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.cyan,
                                  ),
                                  border: const OutlineInputBorder(),
                                  errorStyle: const TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                onSaved: (value) {
                                  passwordEditingController.text = value!;
                                },
                                controller: passwordEditingController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white.withOpacity(0.2),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                autofocus: false,
                                obscureText: _obsureText,
                                decoration: InputDecoration(
                                  labelText: 'Confirm password',
                                  prefixIcon: const Icon(
                                    Icons.vpn_key,
                                    color: Colors.amberAccent,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        SecondOBsecure = !SecondOBsecure;
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
                                  labelStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.cyan,
                                  ),
                                  border: const OutlineInputBorder(),
                                  errorStyle: const TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                onSaved: (value) {
                                  confirmPasswordEditingController.text =
                                      value!;
                                },
                                controller: confirmPasswordEditingController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please  Enter confirm password';
                                  } else if (confirmPasswordEditingController
                                          .text !=
                                      passwordEditingController.text) {
                                    return 'Password do not match';
                                  }

                                  return null;
                                },
                              ),
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     if (_formKey.currentState!.validate()) {
                          //       setState(() {
                          //         email = emailController.text.trim();
                          //         password = passwordController.text.trim();
                          //         confirmpassword =
                          //             confirmpassController.text.trim();
                          //       });
                          //       resistration();
                          //     }
                          //   },
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       color: Colors.green,
                          //       gradient: const LinearGradient(
                          //         colors: [
                          //           Colors.green,
                          //           Colors.cyan,
                          //           Colors.blue
                          //         ],
                          //       ),
                          //       borderRadius: BorderRadius.circular(10),
                          //     ),
                          //     child: Text('SignUp'),
                          //   ),
                          //   ),
                          GestureDetector(
                            onTap: () async {
                              // FutureBuilder(
                              //   future: await signUp(emailController.text,
                              //       passwordController.text),
                              //   builder: (context, AsyncSnapshot snapshot) {
                              //     if (snapshot.hasData) {
                              //       return const MLoginPage();
                              //     }
                              //     return const Center(
                              //       child: CircularProgressIndicator(
                              //           color: Colors.teal),
                              //     );
                              //   },
                              // );
                              signUp(emailEditingController.text,
                                  passwordEditingController.text);
                            },
                            // onTap: () {
                            //   signUp(emailEditingController.text,
                            //       passwordEditingController.text);
                            // },
                            // onTap: () {
                            //   if (_formKey.currentState!.validate()) {
                            //     setState(() {
                            //       email = emailController.text;
                            //       password = passwordController.text;
                            //       confirmpassword = confirmpassController.text;
                            //     });
                            //     resistration();
                            //   }
                            // },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.green,
                                      Colors.cyan,
                                      Colors.blue
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              height: 40,
                              width: 90,
                              child: const Center(
                                child: Text(
                                  'SignUp',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.zero,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                const MLoginPage(),
                                        transitionDuration:
                                            const Duration(seconds: 0),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      gradient: const LinearGradient(
                                        colors: [
                                          Colors.green,
                                          Colors.cyan,
                                          Colors.blue
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Login Again!',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )

                                // TextButton(
                                //   onPressed: () {
                                //     Navigator.pushReplacement(
                                //         context,
                                //         PageRouteBuilder(
                                //             pageBuilder: (context, animation1,
                                //                     animation2) =>
                                //                 LoginPage(),
                                //             transitionDuration:
                                //                 const Duration(seconds: 0)));
                                //   },
                                //   child: const Text(
                                //     'Login',
                                //     style: TextStyle(
                                //       color: Colors.amberAccent,
                                //       fontSize: 20,
                                //       fontWeight: FontWeight.bold,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp(String email, String password) async {
    isLoding = true;
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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
    isLoding = false;
  }

  Future<void> postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values
    setState(() {
      isLoding = true;
    });

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;
    userModel.profile = user.photoURL;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(
      msg: "Account created successfully",
      fontSize: 23,
      backgroundColor: Colors.black,
      textColor: Colors.amber,
    );

    // Navigator.pushAndRemoveUntil(
    //   (context),
    //   MaterialPageRoute(
    //     builder: (context) => const MLoginPage(),
    //   ),
    //   (route) => false,
    // );
    // setState(() {
    //   isLoding = false;
    // });
  }
}
// if(value!=null){
// FirebaseStorage.collection('users).add(email, password).then((value){
// Navigator })}
//! We generally use the collection to collect data in your firebase storage
//! add what kind of data do you want to store 
/*

Stack(
        children: [
          VideoWidget(
            controller: VideoPlayerController.asset('assets/lives.mp4'),
          ),
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/n16.jpg'),
                ),
              ),
              //   decoration: const BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular(30)),
              //     image: DecorationImage(
              //       filterQuality: FilterQuality.low,
              //       fit: BoxFit.fill,
              //       image: AssetImage('assets/n12.jpg'),
              //     ),
              height: 250,

              //child: Center(child: Text("")),
            ),
          ),
          
          Container(
            height: 404,
            decoration: BoxDecoration(
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
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.black, fontSize: 15),
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
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      autofocus: false,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
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
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Confirm password',
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    controller: confirmpassController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm password';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ]

                // Form(
                //     key: _formKey,
                //     child: Container(
                //       height: double.infinity,
                //       decoration: BoxDecoration(

                //         border: Border.all(color: Colors.white10.withAlpha(80)),
                //         borderRadius: BorderRadius.circular(20),

                //       ),
                //       child: Center(
                //         child: Padding(
                //    padding: const EdgeInsets.symmetric(
                //     vertical: 160, horizontal: 20),
                // child: SingleChildScrollView(
                //   child: Column(
                //     children: [

                //       Container(
                //         height: 404,
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //               color: Colors.white10.withAlpha(80)),
                //           borderRadius: BorderRadius.circular(20),
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.white.withAlpha(100),
                //               blurRadius: 10.0,
                //               spreadRadius: 0.0,
                //             ),
                //           ],
                //           color: Colors.white.withOpacity(0.2),
                //         ),
                //         child: Column(
                //           children: [
                //             Padding(
                //               padding: const EdgeInsets.symmetric(
                //                   horizontal: 10),
                //               child: Container(
                //                 margin: const EdgeInsets.symmetric(
                //                     vertical: 10),
                //                 child: TextFormField(
                //                   autofocus: false,
                //                   decoration: const InputDecoration(
                //                     labelText: 'Name',
                //                     labelStyle: TextStyle(fontSize: 20),
                //                     border: OutlineInputBorder(),
                //                     errorStyle: TextStyle(
                //                         color: Colors.black, fontSize: 15),
                //                   ),
                //                   controller: emailController,
                //                   validator: (value) {
                //                     if (value == null || value.isEmpty) {
                //                       return 'Please enter email';
                //                     } else if (!value.contains('@')) {
                //                       return 'Please enter valid email';
                //                     }
                //                     return null;
                //                   },
                //                 ),
                //               ),
                //             ),
                //             Center(
                //               child: Padding(
                //                 padding: const EdgeInsets.symmetric(
                //                     horizontal: 10),
                //                 child: Container(
                //                   margin: const EdgeInsets.symmetric(
                //                       vertical: 10),
                //                   child: TextFormField(
                //                     autofocus: false,
                //                     decoration: const InputDecoration(
                //                       labelText: 'Email',
                //                       labelStyle: TextStyle(fontSize: 20),
                //                       border: OutlineInputBorder(),
                //                       errorStyle: TextStyle(
                //                           color: Colors.black,
                //                           fontSize: 15),
                //                     ),
                //                     controller: emailController,
                //                     validator: (value) {
                //                       if (value == null || value.isEmpty) {
                //                         return 'Please enter email';
                //                       } else if (!value.contains('@')) {
                //                         return 'Please enter valid email';
                //                       }
                //                       return null;
                //                     },
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.symmetric(
                //                   horizontal: 10),
                //               child: Container(
                //                 margin: const EdgeInsets.symmetric(
                //                     vertical: 10),
                //                 child: TextFormField(
                //                   autofocus: false,
                //                   obscureText: true,
                //                   decoration: const InputDecoration(
                //                     labelText: 'Password',
                //                     labelStyle: TextStyle(fontSize: 20),
                //                     border: OutlineInputBorder(),
                //                     errorStyle: TextStyle(
                //                         color: Colors.black, fontSize: 15),
                //                   ),
                //                   controller: passwordController,
                //                   validator: (value) {
                //                     if (value == null || value.isEmpty) {
                //                       return 'Please enter password';
                //                     }
                //                     return null;
                //                   },
                //                 ),
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.symmetric(
                //                   horizontal: 10),
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                     borderRadius:
                //                         BorderRadius.circular(20)),
                //                 margin: const EdgeInsets.symmetric(
                //                     vertical: 10),
                //                 child: TextFormField(
                //                   autofocus: false,
                //                   obscureText: true,
                //                   decoration: const InputDecoration(
                //                     labelText: 'Confirm password',
                //                     labelStyle: TextStyle(fontSize: 20),
                //                     border: OutlineInputBorder(),
                //                     errorStyle: TextStyle(
                //                         color: Colors.black, fontSize: 15),
                //                   ),
                //                   controller: confirmpassController,
                //                   validator: (value) {
                //                     if (value == null || value.isEmpty) {
                //                       return 'Please confirm password';
                //                     }
                //                     return null;
                //                   },
                //                 ),
                //               ),
                //             ),
                //             // Container(
                //             //   margin: const EdgeInsets.symmetric(
                //             //     horizontal: 20,
                //             //   ),
                //             //   decoration: BoxDecoration(
                //             //       color: Colors.green,
                //             //       gradient: const LinearGradient(
                //             //         colors: [
                //             //           Colors.green,
                //             //           Colors.orange,
                //             //           Colors.blue
                //             //         ],
                //             //       ),
                //             //       borderRadius: BorderRadius.circular(20)),
                //             //   child: Row(
                //             //     mainAxisAlignment: MainAxisAlignment.center,
                //             //     children: [
                //             //       ElevatedButton(
                //             //         onPressed: () {
                //             //           if (_formKey.currentState!.validate()) {
                //             //             setState(() {
                //             //               email = emailController.text;
                //             //               password = passwordController.text;
                //             //               confirmpassword =
                //             //                   confirmpassController.text;
                //             //             });
                //             //             resistration();
                //             //           }
                //             //         },
                //             //         child: const Text(
                //             //           'SignUp',
                //             //           style: TextStyle(
                //             //               fontSize: 18, color: Colors.white),
                //             //         ),
                //             //       ),
                //             //     ],
                //             //   ),
                //             // ),
                //             InkWell(
                //               onTap: () {
                //                 if (_formKey.currentState!.validate()) {
                //                   setState(() {
                //                     email = emailController.text;
                //                     password = passwordController.text;
                //                     confirmpassword =
                //                         confirmpassController.text;
                //                   });
                //                   resistration();
                //                 }
                //               },
                //               child: Container(
                //                 margin: const EdgeInsets.symmetric(
                //                     horizontal: 10),
                //                 height: 50,
                //                 width: 100,
                //                 decoration: BoxDecoration(
                //                     color: Colors.green,
                //                     gradient: const LinearGradient(
                //                       colors: [
                //                         Colors.green,
                //                         Colors.orange,
                //                         Colors.blue
                //                       ],
                //                     ),
                //                     borderRadius:
                //                         BorderRadius.circular(20)),
                //                 child: const Center(
                //                   child: Text(
                //                     'SignUp',
                //                     style: TextStyle(
                //                         fontSize: 18, color: Colors.white),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             Container(
                //               padding: EdgeInsets.zero,
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   const Text(
                //                     'Login',
                //                     style: TextStyle(
                //                       color: Colors.black87,
                //                       fontSize: 20,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                   TextButton(
                //                     onPressed: () {
                //                       Navigator.pushReplacement(
                //                           context,
                //                           PageRouteBuilder(
                //                               pageBuilder: (context,
                //                                       animation1,
                //                                       animation2) =>
                //                                   LoginPage(),
                //                               transitionDuration:
                //                                   const Duration(
                //                                       seconds: 0)));
                //                     },
                //                     child: const Text(
                //                       'Login',
                //                       style: TextStyle(
                //                         color: Colors.blue,
                //                         fontSize: 20,
                //                         fontWeight: FontWeight.bold,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                //     ),
                //   ),
                // )),
                ),
          ),
        ],
      ),
*/