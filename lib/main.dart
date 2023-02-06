import 'dart:isolate';

import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapp/authontication/anmitedsp.dart';
import 'package:firebaseapp/authontication/signUp.dart';

import 'package:firebaseapp/authontication/usermodel.dart';

import 'package:firebaseapp/tab.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import 'authontication/newlogin.dart';
import 'authontication/userprofile.dart';
import 'models/adnext.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AdmobHelper.initialize();
  // if (kIsWeb) {
  //   const apiKey = "AIzaSyAmLGeyiWGh0mY6AU9c_cBI31ykAs5AUgs";
  //   const projectId = "fir-app-462c7";
  //   const messaginSenderId = "274363161170";
  //   const appid = "1:274363161170:web:50593a93d30bbe09621d8b";
  // } else {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp();
  //   // MobileAds.instance.initialize();
  // }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserModel userModel = UserModel();
  late final User firebaseUser;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "ND",
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          //  home: const IntroPage(),
          home: SignUp(),
        );
        //  MultiProvider(
        //   providers: [
        //     ChangeNotifierProvider<AdProvider>(
        //       create: (context) => AdProvider(),
        //     ),
        //   ],
        //   child: MaterialApp(
        //     debugShowCheckedModeBanner: false,
        //     title: "ND",
        //     theme: ThemeData(
        //       primarySwatch: Colors.blue,
        //       visualDensity: VisualDensity.adaptivePlatformDensity,
        //     ),
        //     // home: SignUp(),
        //     // home: Mainpart(),
        //     //   home: Loginanother(),
        //     //   //home: CompleteProfile(),
        //     home: IntroPage(),
        //     //   // home: loop(),
        //     //   //    home: const Mainpage(),
        //     //   //home: SplashPage(),
        //     //   //home: LoginPage(),
        //     //   //   home: Hotstar()
        //     //   // home: HomeScreensss(),
        //     //   //  home: Authenticate(),
        //     //   //home: HomeButton(),
        //     //   //home: Dashboard(),
        //     //   // home: MyTabs(),
        //     //   //home: Home(),
        //     //   //home: MainPage(),
        //     //   // home:   Animcss(),
        //     // );,
        //   ),
        // );
        //  MaterialApp(
        //   debugShowCheckedModeBanner: false,
        //   title: "ND",
        //   theme: ThemeData(
        //     primarySwatch: Colors.blue,
        //     visualDensity: VisualDensity.adaptivePlatformDensity,
        //   ),
        //   //  home: SignUp(),
        //   // home: Mainpart(),
        //   home: Loginanother(),
        //   //home: CompleteProfile(),
        //   // home: IntroPage(),
        //   // home: loop(),
        //   //    home: const Mainpage(),
        //   //home: SplashPage(),
        //   //home: LoginPage(),
        //   //   home: Hotstar()
        //   // home: HomeScreensss(),
        //   //  home: Authenticate(),
        //   //home: HomeButton(),
        //   //home: Dashboard(),
        //   // home: MyTabs(),
        //   //home: Home(),
        //   //home: MainPage(),
        //   // home:   Animcss(),
        // );
      },
    );
  }
}

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);
  //const Mainpage({required super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  late bool isLoding = false;
  bool hideUi = false;
  final Connectivity _connectivity = Connectivity();
  @override
  void initState() {
    _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        setState(() {
          hideUi = true;
        });
      } else {
        setState(() {
          hideUi = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.cyan),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else if (snapshot.hasData) {
              return hideUi
                  ? Center(
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 160,
                          ),
                          Center(
                              child: Icon(
                            Icons.network_check_outlined,
                            size: 50,
                          )),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: Text(
                            'Sorry!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'No Internet Connection',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : MyTabs();
            }
            return const MLoginPage();
          },
        ),
      );
}
/*
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:firebase_storage/firebase_storage.dart';
//
// import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart'; // For Image Picker
// // import 'package:path/path.dart' as Path;
//
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import 'package:flutter/services.dart';
// import 'package:path/path.dart';
//
// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//
//   await Firebase.initializeApp();
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   static final String title = 'Firebase Upload';
//
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: title,
//         theme: ThemeData(primarySwatch: Colors.green),
//         home: MainPage(),
//       );
// }
//
// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   UploadTask? task;
//   File? file;
//     firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;
//
//   File? _photo;
//   final ImagePicker _picker = ImagePicker();
//
//   Future imgFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _photo = File(pickedFile.path);
//         uploadFile();
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future imgFromCamera() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);

//     setState(() {
//       if (pickedFile != null) {
//         _photo = File(pickedFile.path);
//         uploadFile();
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future uploadFile() async {
//     if (_photo == null) return;
//     final fileName = basename(_photo!.path);
//     final destination = 'files/$fileName';

//     try {
//       final ref = firebase_storage.FirebaseStorage.instance
//           .ref(destination)
//           .child('file/');
//       await ref.putFile(_photo!);
//     } catch (e) {
//       print('error occured');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final fileName = file != null ? basename(file!.path) : 'No File Selected';

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(MyApp.title),
//         centerTitle: true,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(32),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ButtonWidget(
//                 text: 'Select File',
//                 icon: Icons.attach_file,
//                 onClicked: selectFile,
//               ),
//               SizedBox(height: 8),
//               Text(
//                 fileName,
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               SizedBox(height: 48),
//               ButtonWidget(
//                 text: 'Upload File',
//                 icon: Icons.cloud_upload_outlined,
//                 onClicked: uploadFile,
//               ),
//               SizedBox(height: 20),
//               task != null ? buildUploadStatus(task!) : Container(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future selectFile() async {
//     final result = await FilePicker.platform.pickFiles(allowMultiple: false);

//     if (result == null) return;
//     final path = result.files.single.path!;

//     setState(() => file = File(path));
//   }

//   Future uploadFile() async {
//     if (file == null) return;

//     final fileName = basename(file!.path);
//     final destination = 'files/$fileName';

//     task = FirebaseApi.uploadFile(destination, file!);
//     setState(() {});

//     if (task == null) return;

//     final snapshot = await task!.whenComplete(() {});
//     final urlDownload = await snapshot.ref.getDownloadURL();

//     print('Download-Link: $urlDownload');
//   }

//   Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
//         stream: task.snapshotEvents,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final snap = snapshot.data!;
//             final progress = snap.bytesTransferred / snap.totalBytes;
//             final percentage = (progress * 100).toStringAsFixed(2);

//             return Text(
//               '$percentage %',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             );
//           } else {
//             return Container();
//           }
//         },
//       );
// }

// class FirebaseApi {
//   static UploadTask? uploadFile(String destination, File file) {
//     try {
//       final ref = FirebaseStorage.instance.ref(destination);

//       return ref.putFile(file);
//     } on FirebaseException catch (e) {
//       return null;
//     }
//   }

//   static UploadTask? uploadBytes(String destination, Uint8List data) {
//     try {
//       final ref = FirebaseStorage.instance.ref(destination);

//       return ref.putData(data);
//     } on FirebaseException catch (e) {
//       return null;
//     }
//   }
// }

// class ButtonWidget extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final VoidCallback onClicked;

//   const ButtonWidget({
//     Key? key,
//     required this.icon,
//     required this.text,
//     required this.onClicked,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) => ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           primary: Color.fromRGBO(29, 194, 95, 1),
//           minimumSize: Size.fromHeight(50),
//         ),
//         child: buildContent(),
//         onPressed: onClicked,
//       );

//   Widget buildContent() => Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, size: 28),
//           SizedBox(width: 16),
//           Text(
//             text,
//             style: TextStyle(fontSize: 22, color: Colors.white),
//           ),
//         ],
//       );
// }
//
// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebaseapp/authontication/mai.dart';
// import 'package:firebaseapp/wallss/homescrennn.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:path/path.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           print('something went wrong');
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: "ND",
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//             visualDensity: VisualDensity.adaptivePlatformDensity,
//           ),
//
//             // home: WLLL(),
//           // home: SplashPage(),
//           home: Mainpage(),
//           // home: LoginPage(),
//           // home: Hotstar()6
//           // home: HomeScreensss(),
//           // home: Authenticate(),
//           // home: HomeButton(),
//           // home: Dashboard(),
//           // home: MyTabs(),
//           // home: Home(),
//           // home: MainPage(),
//           // home: Animcss(),
//         );
//       },
//     );
//   }
// }

// class ImageUploads extends StatefulWidget {
//   const ImageUploads({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _ImageUploadsState createState() => _ImageUploadsState();
// }

// class _ImageUploadsState extends State<ImageUploads> {
//   firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;

//   File? _photo;
//   final ImagePicker _picker = ImagePicker();

//   Future imgFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _photo = File(pickedFile.path);
//         uploadFile();
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future imgFromCamera() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);

//     setState(() {
//       if (pickedFile != null) {
//         _photo = File(pickedFile.path);
//         uploadFile();
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future uploadFile() async {
//     if (_photo == null) return;
//     final fileName = basename(_photo!.path);
//     final destination = 'files/$fileName';

//     try {
//       final ref = firebase_storage.FirebaseStorage.instance
//           .ref(destination)
//           .child('file/');
//       await ref.putFile(_photo!);
//     } catch (e) {
//       print('error occured');
//     }
//     print(destination);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: <Widget>[
//           const SizedBox(
//             height: 32,
//           ),
//           Center(
//             child: GestureDetector(
//               onTap: () {
//                 _showPicker(context);
//               },
//               child: CircleAvatar(
//                 radius: 55,
//                 backgroundColor: const Color(0xffFDCF09),
//                 child: _photo != null
//                     ? ClipRRect(
//                         borderRadius: BorderRadius.circular(50),
//                         child: Image.file(
//                           _photo!,
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.fitHeight,
//                         ),
//                       )
//                     : Container(
//                         decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(50)),
//                         width: 100,
//                         height: 100,
//                         child: Icon(
//                           Icons.camera_alt,
//                           color: Colors.grey[800],
//                         ),
//                       ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   void _showPicker(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return SafeArea(
//             child: Container(
//               padding: EdgeInsets.zero,
//               child: Wrap(
//                 children: <Widget>[
//                   ListTile(
//                       leading: const Icon(Icons.photo_library),
//                       title: const Text('Gallery'),
//                       onTap: () {
//                         imgFromGallery();
//                         Navigator.of(context).pop();
//                       }),
//                   ListTile(
//                     leading: const Icon(Icons.photo_camera),
//                     title: const Text('Camera'),
//                     onTap: () {
//                       imgFromCamera();
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }

// // import 'dart:io';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// // import 'package:path/path.dart' as Path;

// class AddImage extends StatefulWidget {
//   @override
//   _AddImageState createState() => _AddImageState();
// }

// class _AddImageState extends State<AddImage> {
//   firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;
//   bool uploading = false;
//   double val = 0;
//   late CollectionReference imgRef;
//   late firebase_storage.Reference ref;

//   List<File> _image = [];
//   final picker = ImagePicker();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Add Image'),
//           actions: [
//             ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     uploading = true;
//                   });
//                   uploadFile().whenComplete(() => Navigator.of(context).pop());
//                 },
//                 child: Text(
//                   'upload',
//                   style: TextStyle(color: Colors.white),
//                 ))
//           ],
//         ),
//         body: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.all(4),
//               child: GridView.builder(
//                   itemCount: _image.length + 1,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3),
//                   itemBuilder: (context, index) {
//                     return index == 0
//                         ? Center(
//                             child: IconButton(
//                                 icon: Icon(Icons.add),
//                                 onPressed: () =>
//                                     !uploading ? chooseImage() : null),
//                           )
//                         : Container(
//                             margin: EdgeInsets.all(3),
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: FileImage(_image[index - 1]),
//                                     fit: BoxFit.cover)),
//                           );
//                   }),
//             ),
//             uploading
//                 ? Center(
//                     child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Container(
//                         child: const Text(
//                           'uploading...',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       CircularProgressIndicator(
//                         value: val,
//                         valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
//                       )
//                     ],
//                   ))
//                 : Container(),
//           ],
//         ));
//   }

//   chooseImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     setState(() {
//       _image.add(File(pickedFile!.path));
//     });
//     if (pickedFile!.path == null) retrieveLostData();
//   }

//   Future<void> retrieveLostData() async {
//     final LostData response = await picker.getLostData();
//     if (response.isEmpty) {
//       return;
//     }
//     if (response.file != null) {
//       setState(() {
//         _image.add(File(response.file!.path));
//       });
//     } else {
//       print(response.file);
//     }
//   }

//   Future uploadFile() async {
//     int i = 1;
//     // var img;
//     //   final fileName = basename(img!.path);
//     for (var img in _image) {
//       setState(() {
//         val = i / _image.length;
//       });
//       ref = firebase_storage.FirebaseStorage.instance
//           .ref()
//           .child('images/${basename(img.path)}');
//       await ref.putFile(img).whenComplete(() async {
//         await ref.getDownloadURL().then((value) {
//           imgRef.add({'url': value});
//           i++;
//         });
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     imgRef = FirebaseFirestore.instance.collection('imageURLs');
//   }
// }


// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:flutter/services.dart';
// import 'package:wallpaperplugin/wallpaperplugin.dart';
// import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//  late List data;
//  late String _localfile;

//   @override
//   void initState() {
//     super.initState();
//     getimages();
//   }

//   Future<String> getimages() async {
//     var getdata = await http.get(
//         'https://api.unsplash.com/search/photos?per_page=30&client_id=LOspW8jcT27D-PLY4mFR22Hj9DIiKIkEbefVyeM3gZ8&query=nature');
//     setState(() {
//       var jsondata = json.decode(getdata.body);
//       data = jsondata['results'];
//     });
//     return "Success";
//   }

//   static Future<bool?> _checkAndGetPermission() async {
//     final PermissionStatus permission = await PermissionHandler()
//         .checkPermissionStatus(PermissionGroup.storage);
//     if (permission != PermissionStatus.granted) {
//       final Map<PermissionGroup, PermissionStatus> permissions =
//           await PermissionHandler()
//               .requestPermissions(<PermissionGroup>[PermissionGroup.storage]);
//       if (permissions[PermissionGroup.storage] != PermissionStatus.granted) {
//         return null;
//       }
//     }
//     return true;
//   }

//   _onTapImage(BuildContext context, values) {
//     return AlertDialog(
//       title: Text("Set as wallpaper ?"),
//       actions: <Widget>[
//         FlatButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text("NO"),
//         ),
//         FlatButton(
//           onPressed: () async {
//             if (await _checkAndGetPermission() != null) {
//               Dio dio = Dio();
//               final Directory appdirectory =
//                   await getExternalStorageDirectory();
//               final Directory directory =
//                   await Directory(appdirectory.path + '/wallpapers')
//                       .create(recursive: true);
//               final String dir = directory.path;
//               final String localfile = '$dir/myimage.jpeg';
//               try {
//                 await dio.download(values, localfile);
//                 setState(() {
//                   _localfile = localfile;
//                 });
//                 Wallpaperplugin.setAutoWallpaper(localFile: _localfile);
//               } on PlatformException catch (e) {
//                 print(e);
//               }
//               Navigator.pop(context);
//             }
//           },
//           child: Text("YES"),
//         ),
//       ],
//     );
//   }

//   @override

//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Wallpaper app",
//       theme: ThemeData(
//         primaryColor: Colors.white,
//       ),
//       home: Scaffold(
//           appBar: AppBar(title: Text("Wallpaper app")),
//           body: Builder(
//             builder: (context) => Swiper(
//               itemBuilder: (BuildContext context, int index) {
//                 return Stack(
//                   children: <Widget>[
//                     InkWell(
//                       onTap: () {
//                         showDialog(
//                             context: context,
//                             builder: (context) => _onTapImage(
//                                 context, data[index]['urls']['small']));
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 50.0),
//                         child: ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(35.0),
//                             topRight: Radius.circular(35.0),
//                             bottomLeft: Radius.circular(35.0),
//                             bottomRight: Radius.circular(35.0),
//                           ),
//                           child: Image.network(
//                             data[index]['urls']['small'],
//                             fit: BoxFit.cover,
//                             height: 500.0,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 );
//               },
//               itemCount: 10,
//               autoplay: true,
//               viewportFraction: 0.8,
//               scale: 0.9,
//             ),
//           )),
//     );
//   }
// }

*/