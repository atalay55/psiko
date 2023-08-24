import 'package:flutter/material.dart';
import 'package:psiko/Database/EntityDb.dart';
import 'package:psiko/Entity/Entity.dart';
import 'package:psiko/Theme/ErrorWidgetTheme.dart';
import '../../Theme/CartTheme.dart';

class DescAgePage extends StatelessWidget {
  late double width;
  DescAgePage(this.width);
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: const Color.fromRGBO(217, 210, 229, 100),
          body: FutureBuilder<List<Entity>>(
              future: EntityDb().getEntity("AgeEntity"),
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
                 return ErrorWidgetTheme();
                }
              }));

  }
}
