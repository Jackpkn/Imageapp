import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebaseapp/json/homejson.dart';
import 'package:firebaseapp/wallss/servies/naturewall.dart';
import 'package:firebaseapp/wallss/servies/wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Qutos extends StatefulWidget {
  @override
  State<Qutos> createState() => _QutosState();
}

class _QutosState extends State<Qutos> {
   
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        // padding: EdgeInsets.all(20),
        height: 121,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListView.builder(
                        itemCount: 9,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            color: Colors.green,
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                          );
                        })
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Boxses extends StatefulWidget {
  const Boxses({Key? key}) : super(key: key);

  @override
  State<Boxses> createState() => _BoxsesState();
}

class _BoxsesState extends State<Boxses> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 4,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_parrot());
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: GestureDetector(
                    child: Container(
                      height: 126,
                      width: 130,

                      decoration: BoxDecoration(
                          // color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     image: DecorationImage(
                      //         fit: BoxFit.cover,
                      //         image: NetworkImage(galasy[index]),),),
                      child: CachedNetworkImage(
                        imageUrl: continueWatching[1]['imageUrl'],
                        // imageUrl: 'assets/n16.jpg',
                        //imageUrl: categories[index].imgUrl.toString(),
                        imageBuilder: ((context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: imageProvider,
                                ),
                              ),
                            )),
                        placeholder: ((context, url) => Center(
                              child: LoadingAnimationWidget.threeArchedCircle(
                                  color: Colors.cyan, size: 40),
                            )),
                      ),
                    ),
                  ),
                ),
                Text(
                  continueWatching[1]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_car());
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: Container(
                    height: 126,
                    width: 130,

                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: NetworkImage(galasy[index]),),),
                    child: CachedNetworkImage(
                      imageUrl: continueWatching[2]['imageUrl'],
                      // imageUrl: 'assets/n16.jpg',
                      //imageUrl: categories[index].imgUrl.toString(),
                      imageBuilder: ((context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          )),
                      placeholder: ((context, url) => Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.cyan, size: 40),
                          )),
                    ),
                  ),
                ),
                Text(
                  continueWatching[2]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_sunset());
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: GestureDetector(
                    child: Container(
                      height: 126,
                      width: 130,

                      decoration: BoxDecoration(
                          // color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     image: DecorationImage(
                      //         fit: BoxFit.cover,
                      //         image: NetworkImage(galasy[index]),),),
                      child: CachedNetworkImage(
                        imageUrl: continueWatching[3]['imageUrl'],
                        // imageUrl: 'assets/n16.jpg',
                        //imageUrl: categories[index].imgUrl.toString(),
                        imageBuilder: ((context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: imageProvider,
                                ),
                              ),
                            )),
                        placeholder: ((context, url) => Center(
                              child: LoadingAnimationWidget.threeArchedCircle(
                                  color: Colors.cyan, size: 40),
                            )),
                      ),
                    ),
                  ),
                ),
                Text(
                  continueWatching[3]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_rose());
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: GestureDetector(
                    child: Container(
                      height: 126,
                      width: 130,

                      decoration: BoxDecoration(
                          // color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     image: DecorationImage(
                      //         fit: BoxFit.cover,
                      //         image: NetworkImage(galasy[index]),),),
                      child: CachedNetworkImage(
                        imageUrl: continueWatching[0]['imageUrl'],
                        // imageUrl: 'assets/n16.jpg',
                        //imageUrl: categories[index].imgUrl.toString(),
                        imageBuilder: ((context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: imageProvider,
                                ),
                              ),
                            )),
                        placeholder: ((context, url) => Center(
                              child: LoadingAnimationWidget.threeArchedCircle(
                                  color: Colors.cyan, size: 40),
                            )),
                      ),
                    ),
                  ),
                ),
                Text(
                  continueWatching[0]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_Nature());
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: Container(
                    height: 126,
                    width: 130,

                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: NetworkImage(galasy[index]),),),
                    child: CachedNetworkImage(
                      imageUrl: continueWatching[4]['imageUrl'],
                      // imageUrl: 'assets/n16.jpg',
                      //imageUrl: categories[index].imgUrl.toString(),
                      imageBuilder: ((context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          )),
                      placeholder: ((context, url) => Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.cyan, size: 40),
                          )),
                    ),
                  ),
                ),
                Text(
                  continueWatching[4]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_boxser());
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: Container(
                    height: 126,
                    width: 130,

                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: NetworkImage(galasy[index]),),),
                    child: CachedNetworkImage(
                      imageUrl: continueWatching[5]['imageUrl'],
                      // imageUrl: 'assets/n16.jpg',
                      //imageUrl: categories[index].imgUrl.toString(),
                      imageBuilder: ((context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          )),
                      placeholder: ((context, url) => Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.cyan, size: 40),
                          )),
                    ),
                  ),
                ),
                Text(
                  continueWatching[5]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_city());
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => City()));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: Container(
                    height: 126,
                    width: 130,

                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: NetworkImage(galasy[index]),),),
                    child: CachedNetworkImage(
                      imageUrl: continueWatching[6]['imageUrl'],
                      // imageUrl: 'assets/n16.jpg',
                      //imageUrl: categories[index].imgUrl.toString(),
                      imageBuilder: ((context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          )),
                      placeholder: ((context, url) => Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.cyan, size: 40),
                          )),
                    ),
                  ),
                ),
                Text(
                  continueWatching[6]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_landscape());
              //  Navigator.push(context,
              //             MaterialPageRoute(builder: (context) => LandaScape()));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: Container(
                    height: 126,
                    width: 130,

                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: NetworkImage(galasy[index]),),),
                    child: CachedNetworkImage(
                      imageUrl: continueWatching[7]['imageUrl'],
                      // imageUrl: 'assets/n16.jpg',
                      //imageUrl: categories[index].imgUrl.toString(),
                      imageBuilder: ((context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          )),
                      placeholder: ((context, url) => Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.cyan, size: 40),
                          )),
                    ),
                  ),
                ),
                Text(
                  continueWatching[7]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_peacock());
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const Peacock()));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.white.withOpacity(0.2),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 215, 1, 1),
                        Colors.blue,
                        Colors.orange,
                        Color.fromARGB(255, 255, 106, 7)
                      ])),
                  child: Container(
                    height: 126,
                    width: 130,

                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: NetworkImage(galasy[index]),),),
                    child: CachedNetworkImage(
                      imageUrl: continueWatching[8]['imageUrl'],
                      // imageUrl: 'assets/n16.jpg',
                      //imageUrl: categories[index].imgUrl.toString(),
                      imageBuilder: ((context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          )),
                      placeholder: ((context, url) => Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.cyan, size: 40),
                          )),
                    ),
                  ),
                ),
                Text(
                  continueWatching[8]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Birds()));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: Container(
                    height: 126,
                    width: 130,

                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: NetworkImage(galasy[index]),),),
                    child: CachedNetworkImage(
                      imageUrl: continueWatching[9]['imageUrl'],
                      // imageUrl: 'assets/n16.jpg',
                      //imageUrl: categories[index].imgUrl.toString(),
                      imageBuilder: ((context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          )),
                      placeholder: ((context, url) => Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.cyan, size: 40),
                          )),
                    ),
                  ),
                ),
                Text(
                  continueWatching[9]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_buttefly());
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const Buterfly()));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: Container(
                    height: 126,
                    width: 130,

                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: NetworkImage(galasy[index]),),),
                    child: CachedNetworkImage(
                      imageUrl: continueWatching[10]['imageUrl'],
                      // imageUrl: 'assets/n16.jpg',
                      //imageUrl: categories[index].imgUrl.toString(),
                      imageBuilder: ((context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          )),
                      placeholder: ((context, url) => Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.cyan, size: 40),
                          )),
                    ),
                  ),
                ),
                Text(
                  continueWatching[10]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_sea());
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const Sea()));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: Container(
                    height: 126,
                    width: 130,

                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: NetworkImage(galasy[index]),),),
                    child: CachedNetworkImage(
                      imageUrl: continueWatching[11]['imageUrl'],
                      // imageUrl: 'assets/n16.jpg',
                      //imageUrl: categories[index].imgUrl.toString(),
                      imageBuilder: ((context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          )),
                      placeholder: ((context, url) => Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.cyan, size: 40),
                          )),
                    ),
                  ),
                ),
                Text(
                  continueWatching[11]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_water());
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const Water()));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: Container(
                    height: 126,
                    width: 130,

                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: NetworkImage(galasy[index]),),),
                    child: CachedNetworkImage(
                      imageUrl: continueWatching[12]['imageUrl'],
                      // imageUrl: 'assets/n16.jpg',
                      //imageUrl: categories[index].imgUrl.toString(),
                      imageBuilder: ((context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          )),
                      placeholder: ((context, url) => Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.cyan, size: 40),
                          )),
                    ),
                  ),
                ),
                Text(
                  continueWatching[12]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_Dark());
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Dark()));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: Container(
                    height: 126,
                    width: 130,

                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: NetworkImage(galasy[index]),),),
                    child: CachedNetworkImage(
                      imageUrl: continueWatching[13]['imageUrl'],
                      // imageUrl: 'assets/n16.jpg',
                      //imageUrl: categories[index].imgUrl.toString(),
                      imageBuilder: ((context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          )),
                      placeholder: ((context, url) => Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.cyan, size: 40),
                          )),
                    ),
                  ),
                ),
                Text(
                  continueWatching[13]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_blur());
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const Blur()));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: Container(
                    height: 126,
                    width: 130,

                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: NetworkImage(galasy[index]),),),
                    child: CachedNetworkImage(
                      imageUrl: continueWatching[14]['imageUrl'],
                      // imageUrl: 'assets/n16.jpg',
                      //imageUrl: categories[index].imgUrl.toString(),
                      imageBuilder: ((context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          )),
                      placeholder: ((context, url) => Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.cyan, size: 40),
                          )),
                    ),
                  ),
                ),
                Text(
                  continueWatching[14]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(_alone());
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const Alone()));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 90,
                  width: 133,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.white.withOpacity(0.2),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 6, 220, 239),
                        Colors.blue,
                        Color.fromARGB(255, 7, 255, 98)
                      ],
                    ),
                  ),
                  child: Container(
                    height: 126,
                    width: 130,

                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: NetworkImage(galasy[index]),),),
                    child: CachedNetworkImage(
                      imageUrl: continueWatching[15]['imageUrl'],
                      // imageUrl: 'assets/n16.jpg',
                      //imageUrl: categories[index].imgUrl.toString(),
                      imageBuilder: ((context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imageProvider,
                              ),
                            ),
                          )),
                      placeholder: ((context, url) => Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.cyan, size: 40),
                          )),
                    ),
                  ),
                ),
                Text(
                  continueWatching[15]['name'],
                  // categories[index].categorieName.toString(),
                  style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Route _parrot() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Parrot(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
          //     .animate(animation),
          //position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _water() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Water(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
          //     .animate(animation),
          //position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _car() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Car(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _sunset() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Sunset(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _rose() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Flowers(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _Nature() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Natur(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          //position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _boxser() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Boxser(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          //position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _city() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const City(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          //position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _landscape() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LandaScape(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          //position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _peacock() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Peacock(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          //position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _birds() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Birds(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          //position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _buttefly() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Buterfly(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _sea() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Sea(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          //position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _Dark() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Dark(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _blur() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Blur(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _alone() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Alone(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

/*
 Container(
            height: 100,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(70),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/n15.jpg'),
              ),
              borderRadius: BorderRadius.circular(10),
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
              borderRadius: BorderRadius.circular(10),
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
              borderRadius: BorderRadius.circular(10),
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
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
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

*/