import 'package:flutter/material.dart';

class Horizon extends StatefulWidget {
  @override
  State<Horizon> createState() => _HorizonState();
}

class _HorizonState extends State<Horizon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      //margin: EdgeInsets.all(2),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 100,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(70),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.elliptical(20, 20),
              ),
              color: Colors.amber,
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
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(70),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.elliptical(20, 20),
              ),
              color: Colors.amber,
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
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(70),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.elliptical(20, 20),
              ),
              color: Colors.amber,
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
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(70),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.elliptical(20, 20),
              ),
              color: Colors.amber,
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
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(70),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.elliptical(20, 20),
              ),
              color: Colors.amber,
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
          ),
        ],
      ),
    );
  }
}
