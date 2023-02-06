import 'package:firebase_core/firebase_core.dart';

import 'package:firebaseapp/firebasecall/firebase_api.dart';
import 'package:firebaseapp/firebasecall/firebase_file.dart';
import 'package:firebaseapp/firebasecall/image_paga.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();

    //futureFiles = FirebaseApi.listAll('files/');
    // futureFiles = FirebaseApi.listAll('sports/');
    futureFiles = FirebaseApi.listAll('sports/');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<FirebaseFile>>(
          future: futureFiles,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return const Center(child: Text('Some error occurred!'));
                } else {
                  final files = snapshot.data!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildHeader(files.length),
                      const SizedBox(height: 12),
                      Expanded(
                        child: ListView.builder(
                          itemCount: files.length,
                          itemBuilder: (context, index) {
                            final file = files[index];

                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ImagePage(file: file),
                                    ),
                                  );
                                },
                                child: buildFile(context, file));
                          },
                        ),
                      ),
                    ],
                  );
                }
            }
          },
        ),
      );

  Widget buildFile(BuildContext context, FirebaseFile file) => Container(
        height: 200,
        width: 90,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(file.url),
          ),
        ),
      );

  // Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
  //       leading: ClipOval(
  //         child: Image.network(
  //           file.url,
  //           width: 52,
  //           height: 52,
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //       title: Text(
  //         file.name,
  //         style: const TextStyle(
  //           fontWeight: FontWeight.bold,
  //           decoration: TextDecoration.underline,
  //           color: Colors.blue,
  //         ),
  //       ),
  //       onTap: () => Navigator.of(context).push(
  //         MaterialPageRoute(
  //           builder: (context) => ImagePage(file: file),
  //         ),
  //       ),
  //     );

  Widget buildHeader(int length) => ListTile(
        tileColor: Colors.blue,
        leading: Container(
          padding: EdgeInsets.zero,
          width: 52,
          height: 52,
          child: const Icon(
            Icons.file_copy,
            color: Colors.white,
          ),
        ),
        title: Text(
          '$length Files',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );
}
