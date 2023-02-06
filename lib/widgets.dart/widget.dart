import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Circles extends StatefulWidget {
  @override
  State<Circles> createState() => _CirclesState();
}

class _CirclesState extends State<Circles> {
  @override
  Widget build(BuildContext context) {
    final Text text;
    return Container(
      padding: EdgeInsets.zero,
      // margin: EdgeInsets.all(20),
      // padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.amber,
              //maxRadius: 20,
              radius: 20,
              backgroundImage: AssetImage('assets/n16.jpg'),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }
}
