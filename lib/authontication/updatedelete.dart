import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateAndDelete extends StatefulWidget {
  const UpdateAndDelete({Key? key}) : super(key: key);

  @override
  State<UpdateAndDelete> createState() => _UpdateAndDeleteState();
}

class _UpdateAndDeleteState extends State<UpdateAndDelete> {
  CollectionReference ref = FirebaseFirestore.instance.collection('UserData');
  @override
  // streamBuilder is generally use for
  // when you upload the data for user you can change the data will automatically change 
  //? 
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var doc = snapshot.data!.docs[index];
                  return ListTile(
                    title: Text(
                      doc['name'],
                      style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        Text(
                          doc['brand'],
                        ),
                        Text(
                          doc['price'],
                        ),
                      ],
                    ),
                    trailing: Image.network(
                      'src',
                      fit: BoxFit.cover,
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: (() {}),
                    ),
                  );
                });
          } else {
            return const Text('Unable to load');
          }
        },
      ),
    );
  }
}
