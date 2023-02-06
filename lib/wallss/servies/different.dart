import 'package:flutter/material.dart';

class Scr extends StatefulWidget {
  final String scree;
  const Scr({Key? key, required this.scree}) : super(key: key);

  @override
  State<Scr> createState() => _ScrState();
}

class _ScrState extends State<Scr> {
  List screnn = [
    'Poupulr',
    'Poupulr',
    'Poupulr',
    'Poupulr',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const  Text('jcal'),),
    );
  }
}
