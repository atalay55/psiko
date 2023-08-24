import 'package:flutter/material.dart';
import 'package:psiko/Database/EntityDb.dart';
import 'package:psiko/Entity/Entity.dart';
import 'package:psiko/Theme/ErrorWidgetTheme.dart';
import '../../Theme/CartTheme.dart';

class MobileAgePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(217, 210, 229, 100),
        body: FutureBuilder<List<Entity>>(
            future: EntityDb().getEntity("AgeEntity"),
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
                      child: const Text("Psikolojik Yas Dönemleri",
                        style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25),
                      ),
                    ),
                    CartTheme(
                        width: width,
                        entities: snapshot.data!,
                        isGame: false,
                       ),
                  ],
                );
              } else {
               return ErrorWidgetTheme();
              }
            }));
  }
}
