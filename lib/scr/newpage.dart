import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/json/homejson.dart';
import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  final imageUrl;
  NewPage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            widget.imageUrl,
          ),
        ),
      ),
    ));
  }
}
