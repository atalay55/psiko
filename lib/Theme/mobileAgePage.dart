import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psiko/Entity/Entity.dart';
import 'CartTheme.dart';

class MobileAgePage extends StatelessWidget {
  late bool isGame;

  MobileAgePage({required this.isGame});

  FirebaseFirestore fire = FirebaseFirestore.instance;

  Future<List<Entity>> getEntity() async {
    late List<Entity> entites = [];
    entites.clear();
    await FirebaseFirestore.instance
        .collection(isGame ? "GameEntity" : "AgeEntity")
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
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: isGame
            ? Color.fromRGBO(218, 212, 199, 10)
            : Color.fromRGBO(217, 210, 229, 100),
        body: FutureBuilder<List<Entity>>(
            future: getEntity(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Padding(
                      padding: width < 600
                          ? EdgeInsets.only(
                              top: width / 8,
                              left: width / 40,
                              bottom: width / 20)
                          : EdgeInsets.only(
                              top: width / 20,
                              left: width / 40,
                              bottom: width / 20),
                      child: Text(
                        isGame ? "Eğlence ve Oyun" : "Psikolojik Yas Dönemleri",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25),
                      ),
                    ),
                    CartTheme(
                        width: width,
                        entities: snapshot.data!,
                        isGame: isGame,
                       ),
                  ],
                );
              } else {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Data Not Found ",
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
