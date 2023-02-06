import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/authontication/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
    return Container(
      color: Colors.grey[500],
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 120,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: double.infinity,
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
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 22),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.green,
                    child: Text('jsal'),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 90, vertical: 24),
                  child: Text(
                    '$email',
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          //   height: 90,
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
          // )
        const   SizedBox(
            height: 30,
          ),
         const  Divider(
            color: Colors.green,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.local_activity),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.local_activity),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.local_activity),
              ],
            ),
          )
        ],
      ),
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
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Text(
              text,
              style: GoogleFonts.akronim(
                  color: Colors.yellow,
                  fontSize: 20,
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 3, 39, 239),
                      fontStyle: FontStyle.italic)),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Profile extends StatefulWidget {
//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   final uid = FirebaseAuth.instance.currentUser!.uid;
//   final email = FirebaseAuth.instance.currentUser!.email;
//   final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;
//   User? user = FirebaseAuth.instance.currentUser;
//   verifyEmail() async {
//     if (user != null && user!.emailVerified) {
//       await user!.sendEmailVerification();
//       print('Verification Email has been sent');
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         backgroundColor: Colors.black,
//         content: Text(
//           'Verification Email has been sent',
//           style: TextStyle(fontSize: 18, color: Colors.amber),
//         ),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 margin:
//                     const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: Colors.green,
//                 ),
//                 child: CircleAvatar(
//                   maxRadius: 20,
//                   minRadius: 20,
//                   foregroundColor: Colors.blue,
//                   backgroundColor: Colors.green,
//                   backgroundImage: const AssetImage('assets/n15.png'),
//                   child: ElevatedButton(
//                       clipBehavior: Clip.antiAlias,
//                       onPressed: () {},
//                       child: const Text('P')),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Email: -->  $email',
//                     style: const TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.greenAccent),
//                   ),
//                   user!.emailVerified
//                       ? const Text(
//                           'Verified',
//                           style:
//                               TextStyle(fontSize: 22, color: Colors.lightBlue),
//                         )
//                       : TextButton(
//                           onPressed: () {
//                             verifyEmail();
//                           },
//                           child: const Text(
//                             'Verify Email',
//                             style:
//                                 TextStyle(fontSize: 22, color: Colors.black54),
//                           ),
//                         ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//     ;
//   }
// }




  // Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(
  //           'Email: -->  $email',
  //           style: const TextStyle(
  //               fontSize: 13,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.greenAccent),
  //         ),
  //         user!.emailVerified
  //             ? const Text(
  //                 'Verified',
  //                 style: TextStyle(fontSize: 22, color: Colors.lightBlue),
  //               )
  //             : TextButton(
  //                 onPressed: () {
  //                   verifyEmail();
  //                 },
  //                 child: const Text(
  //                   'Verify Email',
  //                   style: TextStyle(fontSize: 22, color: Colors.black54),
  //                 ),
  //               ),
  //       ],
  //     ),
  //     const SizedBox(
  //       height: 120,
  //     ),
  //     Column(
  //       children: [
  //         const Text(
  //           'Created',
  //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //         ),
  //         Text(
  //           creationTime.toString(),
  //           style:
  //               const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //         ),
  //       ],
  //     ),