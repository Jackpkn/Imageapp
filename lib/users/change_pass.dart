 

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebaseapp/authontication/login_page.dart';
// import 'package:flutter/material.dart';

// class ChangePass extends StatefulWidget {
//   const ChangePass({Key? key}) : super(key: key);

//   @override
//   State<ChangePass> createState() => _ChangePassState();
// }

// class _ChangePassState extends State<ChangePass> {
//   final _formKey = GlobalKey<FormState>();
//   var newPassword = " ";
//   final newPasswordController = TextEditingController();
//   @override
//   void dispose() {
//     newPasswordController.dispose();
//     super.dispose();
//   }

//   final currentUser = FirebaseAuth.instance.currentUser;

//   changePassword() async {
//     try {
//       await currentUser!.updatePassword(newPassword);
//       FirebaseAuth.instance.signOut();
//       // ignore: use_build_context_synchronously
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => LoginPage(),
//         ),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         backgroundColor: Colors.black38,
//         content: Text('Your password has been changed .. Login again!'),
//       ));
//     } catch (error) {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
//           child: ListView(
//             children: [
//               const SizedBox(
//                 height: 100,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Image.asset('assets/taz.png'),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(vertical: 10),
//                 child: TextFormField(
//                   autofocus: false,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'New Password',
//                     hintText: 'Enter new Password',
//                     labelStyle: TextStyle(fontSize: 20),
//                     border: OutlineInputBorder(),
//                     errorStyle: TextStyle(color: Colors.black26, fontSize: 15),
//                   ),
//                   controller: newPasswordController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter Password';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       newPassword = newPasswordController.text;
//                     }
//                     changePassword();
//                   },
//                   child: const Text(
//                     'Change Password',
//                     style: TextStyle(fontSize: 18),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
