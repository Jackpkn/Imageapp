import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  // const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailcontroller,
            cursorColor: Colors.green,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'email'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: emailcontroller,
            cursorColor: Colors.green,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(labelText: 'password'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: signIn,
            icon: Icon(Icons.lock_open),
            label: Text('Sign in'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
          ), 
          RichText(text: TextSpan(text: 'No account?'))
        ],
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
   // navigatorKey.currenState!.popUntil((route)=route.isFirst>);
  }
}
