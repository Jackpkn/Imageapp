// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSign extends StatefulWidget {
//   @override
//   _GoogleSignState createState() => _GoogleSignState();
// }

// class _GoogleSignState extends State<GoogleSign> {
//   bool _isLoggedIn = false;
//   late GoogleSignInAccount _userObj;
//   GoogleSignIn _googleSignIn = GoogleSignIn();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Codesundar")),
//       body: Container(
//         child: _isLoggedIn
//             ? Column(
//                 children: [
//                   Image.network(_userObj.photoUrl),
//                   Text(_userObj.displayName),
//                   Text(_userObj.email),
//                   TextButton(
//                       onPressed: () {
//                         _googleSignIn.signOut().then((value) {
//                           setState(() {
//                             _isLoggedIn = false;
//                           });
//                         }).catchError((e) {});
//                       },
//                       child: const Text("Logout"))
//                 ],
//               )
//             : Center(
//                 child: ElevatedButton(
//                   child: const Text("Login with Google"),
//                   onPressed: () {
//                     _googleSignIn.signIn().then((userData) {
//                       setState(() {
//                         _isLoggedIn = true;
//                         _userObj = userData;
//                       });
//                     }).catchError((e) {
//                       print(e);
//                     });
//                   },
//                 ),
//               ),
//       ),
//     );
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebaseapp/authontication/login_page.dart';
// import 'package:firebaseapp/nav/homenav.dart';
// import 'package:firebaseapp/tab.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();

// //SIGN IN KA Function
// class AuthService {
//   handleAuthState() {
//     return StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (BuildContext context, snapshot) {
//           if (snapshot.hasData) {
//             return MyTabs();
//           } else {
//             return LoginPage();
//           }
//         });
//   }

//   Future<Object?> signInWithGoogle() async {
//     // showDialog(
//     //   context: context,
//     //   builder: (context) => const Center(
//     //     child: CircularProgressIndicator(),
//     //   ),
//     // );
 
 
//     try {
//       //SIGNING IN WITH GOOGLE
//       final GoogleSignInAccount googleSignInAccount =
//           await googleSignIn.signIn();
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;

//       //CREATING CREDENTIAL FOR FIREBASE
//       final AuthCredential credential = GoogleAuthProvider.credential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken);

//       //SIGNING IN WITH CREDENTIAL & MAKING A USER IN FIREBASE  AND GETTING USER CLASS
//       final userCredential = await _auth.signInWithCredential(credential);
//       final User? user = userCredential.user;

//       //CHECKING IS ON
//       assert(!user!.isAnonymous);
//       assert(await user!.getIdToken() != null);

//       final User? currentUser = await _auth.currentUser;
//       assert(currentUser!.uid == user!.uid);
//       print(user);
//       return user;
//     } on FirebaseAuthException catch (e) {
//       print(e);
//     }

//     //return null;
//   }

//   void signOut() async {
//     await googleSignIn.signOut();
//     await _auth.signOut();
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebaseapp/authontication/login_page.dart';
// import 'package:firebaseapp/tab.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthService {
//   handleAuthState() {
//     return StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (BuildContext context, snapshot) {
//           if (snapshot.hasData) {
//             return MyTabs();
//           } else {
//             return LoginPage();
//           }
//         });
//   }

//   signInWithGoogle() async {
//     final GoogleSignInAccount googleUser =
//         await GoogleSignIn(scopes: <String>['email']).signIn();

//     final GoogleSignInAuthentication googlAuth =
//         await googleUser.authentication;
//     final credintial = GoogleAuthProvider.credential(
//       accessToken: googlAuth.accessToken,
//       idToken: googlAuth.idToken,
//     );
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/tab.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_sign_in/google_sign_in.dart';
  final FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
//User? user = googleSignIn.currentUser as User?;
bool isLoading = false;
    Future signup(BuildContext context) async {

  // final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  // ignore: unnecessary_null_comparison
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    User? user = result.user;
    return result;

    // if (result != null) {
    //   // ignore: use_build_context_synchronously
    //   firebaseFirestore.collection('user').doc(user!.uid).set({'email':user.email,'name': user.displayName, 'photo_url':user.photoURL}).then((value) {
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => MyTabs()));
    //   });

      // ignore: use_build_context_synchronously
      // AnimatedSnackBar.material(
      //   'This a snackbar with info type and a very very very long text',
      //   type: AnimatedSnackBarType.info,
      //   mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      //   desktopSnackBarPosition: DesktopSnackBarPosition.bottomLeft,
      //   snackBarStrategy: RemoveSnackBarStrategy(),
      // ).show(context);

  //     Fluttertoast.showToast(
  //         fontSize: 23,
  //         msg: 'Login successful',
  //         backgroundColor: Colors.black,
  //         textColor: Colors.amber);
  //   } // if result not null we simply call the MaterialpageRoute,
  //   // for go to the HomePage screen
  // }
}
  Future<void>handleAuth()async{
    showDialog(context: context, builder: (context){
      return Center(child: CircularProgressIndicator(color: Colors.green,),);
    });
   await signup(context).then((value){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyTabs()));
    } );
}

}
// Future logout() async {
//   googleSignIn.disconnect();
//   FirebaseAuth.instance.signOut();
// }

Future logout() async {
  GoogleSignIn().disconnect();
  FirebaseAuth.instance.signOut();
}
