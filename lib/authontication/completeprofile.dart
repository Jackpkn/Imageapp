// import 'dart:developer';
// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebaseapp/authontication/uihelper.dart';
// import 'package:firebaseapp/authontication/usermodel.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
 
// import 'package:image_picker/image_picker.dart';

// class CompleteProfile extends StatefulWidget {
//   final UserModel userModel;
//   final User firebaseUser;

//   const CompleteProfile(
//       {Key? key, required this.userModel, required this.firebaseUser})
//       : super(key: key);

//   @override
//   _CompleteProfileState createState() => _CompleteProfileState();
// }

// class _CompleteProfileState extends State<CompleteProfile> {

  
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController cPasswordController = TextEditingController();

//   void checkValuet() {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//     String cPassword = cPasswordController.text.trim();

//     if(email == "" || password == "" || cPassword == "") {
//       UIHelper.showAlertDialog(context, "Incomplete Data", "Please fill all the fields");
//     }
//     else if(password != cPassword) {
//       UIHelper.showAlertDialog(context, "Password Mismatch", "The passwords you entered do not match!");
//     }
//     else {
//       signUp(email, password);
//     }
//   }

//   void signUp(String email, String password) async {
//     UserCredential? credential;

//     UIHelper.showLoadingDialog(context, "Creating new account..");

//     try {
//       credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch(ex) {
//       Navigator.pop(context);

//       UIHelper.showAlertDialog(context, "An error occured", ex.message.toString());
//     }

//     if(credential != null) {
//       String uid = credential.user!.uid;
//       UserModel newUser = UserModel(
//         uid: uid,
//         email: email,
//         fullname: "",
//         profilepic: ""
//       );
//       await FirebaseFirestore.instance.collection("users").doc(uid).set(newUser.toMap()).then((value) {
//         print("New User Created!");
//         Navigator.popUntil(context, (route) => route.isFirst);
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return CompleteProfile(userModel: newUser, firebaseUser: credential!.user!);
//             }
//           ),
//         );
//       });
//     }
    
//   }
//   File? imageFile;
//   TextEditingController fullNameController = TextEditingController();

//   void selectImage(ImageSource source) async {
//     XFile? pickedFile = await ImagePicker().pickImage(source: source);
//   setState(() {
//   //       imageFile = croppedImage;
//       });
//     // if(pickedFile != null) {
//     //   cropImage(pickedFile);
//     // }
//   }

//   // void cropImage(XFile file) async {
//   //   CroppedFile? croppedImage = await ImageCropper.cropImage(
//   //     sourcePath: file.path,
//   //     aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
//   //     compressQuality: 20
//   //   );

//   //   if(croppedImage != null) {
//   //     setState(() {
//   //       imageFile = croppedImage;
//   //     });
//   //   }
//   // }

//   void showPhotoOptions() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Upload Profile Picture"),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(
//                   onTap: () {
//                     Navigator.pop(context);
//                     selectImage(ImageSource.gallery);
//                   },
//                   leading: Icon(Icons.photo_album),
//                   title: Text("Select from Gallery"),
//                 ),
//                 ListTile(
//                   onTap: () {
//                     Navigator.pop(context);
//                     selectImage(ImageSource.camera);
//                   },
//                   leading: Icon(Icons.camera_alt),
//                   title: Text("Take a photo"),
//                 ),
//               ],
//             ),
//           );
//         });
//   }

//   void checkValues() {
//     String fullname = fullNameController.text.trim();

//     if (fullname == "" || imageFile == null) {
//       print("Please fill all the fields");
//       UIHelper.showAlertDialog(context, "Incomplete Data",
//           "Please fill all the fields and upload a profile picture");
//     } else {
//       log("Uploading data..");
//       uploadData();
//     }
//   }

//   void uploadData() async {
//     UIHelper.showLoadingDialog(context, "Uploading image..");

//     UploadTask uploadTask = FirebaseStorage.instance
//         .ref("profilepictures")
//         .child(widget.userModel.uid.toString())
//         .putFile(imageFile!);

//     TaskSnapshot snapshot = await uploadTask;

//     String? imageUrl = await snapshot.ref.getDownloadURL();
//     String? fullname = fullNameController.text.trim();

//     widget.userModel.fullname = fullname;
//     widget.userModel.profilepic = imageUrl;

//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc(widget.userModel.uid)
//         .set(widget.userModel.toMap())
//         .then((value) {
//       log("Data uploaded!");
//       Navigator.popUntil(context, (route) => route.isFirst);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         title: Text("Complete Profile"),
//       ),
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 40),
//           child: ListView(
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               CupertinoButton(
//                 onPressed: () {
//                   showPhotoOptions();
//                 },
//                 padding: EdgeInsets.all(0),
//                 child: CircleAvatar(
//                   radius: 60,
//                   backgroundImage:
//                       (imageFile != null) ? FileImage(imageFile!) : null,
//                   child: (imageFile == null)
//                       ? Icon(
//                           Icons.person,
//                           size: 60,
//                         )
//                       : null,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextField(
//                 controller: fullNameController,
//                 decoration: InputDecoration(
//                   labelText: "Full Name",
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               CupertinoButton(
//                 onPressed: () {
//                   checkValues();
//                 },
//                 color: Theme.of(context).colorScheme.secondary,
//                 child: Text("Submit"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
