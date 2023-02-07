import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psiko/Entity/Entity.dart';
import '../../Theme/CartTheme.dart';

class DescAgePage extends StatelessWidget {

  late final width;


  DescAgePage({required this.width});


  FirebaseFirestore fire = FirebaseFirestore.instance;

  Future<List<Entity>> getEntity() async {
    late List<Entity> entites = [];
    entites.clear();
    await FirebaseFirestore.instance
        .collection("AgeEntity")
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        entites.add(Entity(name: element["name"], imagePath: element["image"]));
      });
    });
    return entites;
  }


  @override
  Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Color.fromRGBO(217, 210, 229, 100),
          body: FutureBuilder<List<Entity>>(
              future: getEntity(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Padding(
                        padding:(width < 801
                            ? EdgeInsets.only(
                            top: width / 8,
                            left: width / 40,
                            bottom: width / 20)
                            : EdgeInsets.only(
                            top: width / 18,
                            left: width / 40,
                            bottom: width / 20)),
                        child: Text("Psikolojik Yas Dönemleri", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: width / 25),),
                      ),
                      CartTheme(
                          width: width,
                          isGame: false,
                          entities: snapshot.data!,

                          ),
                    ],
                  );
                } else {
                  return Container(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         CircularProgressIndicator(
                           color: Colors.black,

                         )
                        ],
                      ),
                    ),
                  );
                }
              }));

  }
}
