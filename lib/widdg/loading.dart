import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 242, 242, 6),
      child: const Center(
        child: Center(
          child: SpinKitFadingCircle(
            color: Colors.lightBlueAccent,
            size: 50,
          ),
        ),
      ),
    );
  }
}
