import 'package:flutter/material.dart';

class Contain extends StatelessWidget {
  final image;
  Contain({
    Key? key,
    //required this.child,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(70),
      decoration: BoxDecoration(
        image: image,
        // image: DecorationImage(
        //     image: AssetImage('assets/n15.jpg'), fit: BoxFit.cover),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.elliptical(20, 20),
        ),
        // color: Colors.amber,
        border: Border.all(
          color: Colors.green,
          width: 3,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
          BoxShadow(
            color: Color.fromARGB(255, 8, 4, 236),
            offset: Offset(
              2.0,
              2.0,
            ), //Offset
            blurRadius: 10.0,
            spreadRadius: 2.0,
          )
        ],
      ),
    );
  }
}
