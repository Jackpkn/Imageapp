import 'package:firebaseapp/drawer/drawer.dart';
import 'package:firebaseapp/users/dashbord.dart';
import 'package:firebaseapp/users/profile.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatefulWidget {
 const  HomeButton({Key? key}) : super(key: key);

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                icon: const Icon(Icons.person))
          ],
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 182, 8, 225),
          flexibleSpace: const Image(
              image: AssetImage(
                'assets/n16.jpg',
              ),
              fit: BoxFit.cover),
          title: const Text(
            'Welcome',
            style: TextStyle(color: Color.fromARGB(255, 233, 6, 221)),
          ),
        ),
    // drawer: AppDrawer(),
        drawer: const Drawer(
          backgroundColor: Colors.tealAccent,
          child: AppDrawer(),
        ),
        //body: Dashboard(),
        //endDrawer: Profile(),
      ),
    );
  }
}
