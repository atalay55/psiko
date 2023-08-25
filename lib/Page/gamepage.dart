

import 'package:flutter/material.dart';

import '../Database/EntityDb.dart';
import '../Entity/Entity.dart';
import '../Theme/gridviewtheme.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromRGBO(232, 208 , 182, 100),
        body: FutureBuilder<List<Entity>>(
            future: EntityDb().getEntity("GameAgeEntity"),
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
                      child: Text("Oyun Dönemleri",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25),
                      ),
                    ),
                    GridViewTheme(
                      entities: snapshot.data!,
                      isGame: true,
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
            }));}


}
