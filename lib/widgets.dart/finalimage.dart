import 'package:firebaseapp/firebasecall/main_page.dart';
import 'package:firebaseapp/quotosfirebase.dart/Awesome.dart';
import 'package:firebaseapp/quotosfirebase.dart/Confidence.dart';
import 'package:firebaseapp/quotosfirebase.dart/Phone.dart';
import 'package:firebaseapp/quotosfirebase.dart/Success.dart';
import 'package:firebaseapp/quotosfirebase.dart/flowers.dart';
import 'package:firebaseapp/quotosfirebase.dart/funnyPic.dart';
import 'package:firebaseapp/quotosfirebase.dart/modern.dart';
import 'package:firebaseapp/wallss/servies/wallpaper.dart';
import 'package:firebaseapp/widgets.dart/newpage.dart';
import 'package:flutter/material.dart';

class Finalimage extends StatefulWidget {
  @override
  State<Finalimage> createState() => _FinalimageState();
}

class _FinalimageState extends State<Finalimage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.cyan,
                  Colors.teal,
                  Colors.limeAccent
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            child: const Text('Quotos For You',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 20,
            width: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                }),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 90,
                      width: 140,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://i.pinimg.com/originals/aa/f5/97/aaf597667d7cc520990588be37cb37d1.jpg'),
                        ),
                      ),
                    ),
                    const Text(
                      'Sports',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Awersome()));
                }),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 90,
                      width: 140,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://th.bing.com/th/id/OIP.cE2FNPqxsAbJImHO8mYHnAHaEy?pid=ImgDet&rs=1'),
                        ),
                      ),
                    ),
                    const Text(
                      'Awesome',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Modern()));
                }),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 90,
                      width: 140,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://th.bing.com/th/id/OIP.NDN_F2QQLj95v3Tqn3VLswHaEK?pid=ImgDet&rs=1'),
                        ),
                      ),
                    ),
                    const Text(
                      'Modern',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Car()));
                }),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 90,
                      width: 140,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://th.bing.com/th/id/OIP.zq_LyBlt7PkuSHjxMeAb3QHaEo?pid=ImgDet&rs=1'),
                        ),
                      ),
                    ),
                    const Text(
                      'Flowers',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Funnypic()));
                }),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 90,
                      width: 140,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://th.bing.com/th/id/OIP.InB-hieJmE1PfviiGBoUjAHaHa?pid=ImgDet&rs=1'),
                        ),
                      ),
                    ),
                    const Text(
                      'Funny picture',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Phone()));
                }),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 90,
                      width: 140,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://i.pinimg.com/736x/1a/34/a9/1a34a95f80bef6633ac53f722f5e5c47--sister-tattoos-blue-butterfly.jpg'),
                        ),
                      ),
                    ),
                    const Text(
                      'Phone',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Success()));
                }),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 90,
                      width: 140,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://th.bing.com/th/id/OIP.iQyRb8hXX9JobukKrp_5FwHaKF?pid=ImgDet&rs=1'),
                        ),
                      ),
                    ),
                    const Text(
                      'Success Quotos',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Confidence()));
                }),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 90,
                      width: 140,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.green,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://th.bing.com/th/id/OIP.NPtpuD4UQIEq202XscL8DAHaEK?pid=ImgDet&rs=1'),
                        ),
                      ),
                    ),
                    const Text(
                      'Confidence',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
