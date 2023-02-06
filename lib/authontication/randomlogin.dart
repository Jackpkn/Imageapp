// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, unused_local_variable, unrelated_type_equality_checks, non_constant_identifier_names

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseapp/authontication/usermodel.dart';
import 'package:firebaseapp/nav/homenav.dart';
import 'package:firebaseapp/scr/newpage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RandomLogin extends StatefulWidget {
  const RandomLogin({Key? key}) : super(key: key);
  @override
  State<RandomLogin> createState() => _RandomLoginState();
}

class _RandomLoginState extends State<RandomLogin> {
  final email = '';
  final password = '';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final brandController = TextEditingController();
  final priceController = TextEditingController();
  final imageUrlController = TextEditingController();
  late Map<String, dynamic> productToAdd;
 
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('product');
      
  addProduct() {
    productToAdd = {
      'name': nameController.text,
      'brand': brandController.text,
      'price': priceController.text,
      'imageUrl': imageUrlController.text,
    };
    collectionReference
        .add(productToAdd)
        .whenComplete(() => print('data successfully Added'));
  }

  buildMethod(TextEditingController controller, String labelText, OnTap onTap) {
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(23),
            child: Column(
              children: [
                buildMethod(nameController, 'Name', (snack) {}),
                const SizedBox(
                  height: 10,
                ),
                buildMethod(nameController, 'Name', (snack) {}),
                const SizedBox(
                  height: 10,
                ),
                buildMethod(nameController, 'Name', (snack) {}),
                const SizedBox(
                  height: 10,
                ),
                buildMethod(nameController, 'Name', (snack) {}),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                    onPressed: () {
                      addProduct();
                    },
                    textColor: Colors.cyan,
                    child: const Text(
                      'Add the data',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ))
                // TextFormField(
                //   controller: emailController,
                //   decoration: const InputDecoration(
                //     hintText: 'Email',
                //     labelText: 'Fill your Email',
                //     prefixIcon: Icon(Icons.email),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // TextFormField(
                //   controller: emailController,
                //   decoration: const InputDecoration(
                //     hintText: 'Password',
                //     labelText: 'Fill your Password',
                //     prefixIcon: Icon(Icons.password),
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //     signUp(emailController.toString().trim(),
                //         passwordController.text);
                //   },
                //   borderRadius: BorderRadius.circular(10),
                //   child: const Text('SignUp'),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }

  void loginUp(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.createUserWithEmailAndPassword(email: email, password: password).then(
          (value) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => NewPage(
                imageUrl: widget.toString(),
              ),
            ),
          ),
        );
  }

  void signUp(String email, String password) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    UserModel userModel = UserModel();
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        // ignore: unnecessary_null_comparison
        if (value != null) {
          firebaseFirestore
              .collection('users')
              .add({'email': email, 'pass': password}).then((value) {
            if (value != Null) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeButton()));
            }
          });
        }
      },
    );
  }

  // sign In Anonymously
  Future<User?> AuthService() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      return null;
    }
  }
}

class CrudData {
  /// write the function to add the user in  FirebaseStorage
  void createUser() async {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      firebaseFirestore
          .collection('userData')
          .doc('testUser')
          .set({'firstName': 'Jhon', 'lastName': 'Peter'});
    } catch (e) {
      print(e);
    }
  }
  // to update the data on firebaseStorage

  void update() async {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      firebaseFirestore
          .collection('UserData')
          .doc('testUser')
          .update({'firstName': 'Alan'});
    } catch (e) {
      print(e);
    }
  }

  void readData() async {
    FirebaseFirestore firebaseStorage = FirebaseFirestore.instance;
    DocumentSnapshot documentSnapshot;

    try {
      documentSnapshot =
          await firebaseStorage.collection('usersData').doc('testUser').get();
      print(documentSnapshot.data());
    } catch (e) {
      print(e);
    }
  }

  void delete() async {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      firebaseFirestore.collection('userData').doc('testUser').delete();
    } catch (e) {
      print(e);
    }
  }
}
