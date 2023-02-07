import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psiko/Entity/GameEntity.dart';
import '../../Theme/GameCardThemeMobile.dart';

class mobileGameDescription extends StatefulWidget {

  late String dataName;
  mobileGameDescription({required this.dataName});


  @override
  State<mobileGameDescription> createState() => _mobileGameDescriptionState();
}

class _mobileGameDescriptionState extends State<mobileGameDescription> {
  final controller = PageController();
  void dispose(){
    controller.dispose();
    super.dispose();
  }


  FirebaseFirestore fire = FirebaseFirestore.instance;

  Future<List<GameEntity>> getEntity() async {
    late List<GameEntity> games = [];
    games.clear();
    await FirebaseFirestore.instance
        .collection(widget.dataName+" oyunlar")
        .get()
        .then((QuerySnapshot q) {
      q.docs.forEach((element) {
        games.add(GameEntity(name: element["name"], imagePath: element["imagePath"], Text: element["gameText"]));
      });
    });
    return games;
  }


  @override
  Widget build(BuildContext context) {
    late final width=MediaQuery.of(context).size.shortestSide;

    return Scaffold(
      body:FutureBuilder<List<GameEntity>>(
          future: getEntity(),
          builder: (context, snapchat) {
            if(snapchat.hasData){
              return GameCardThemeMobile(gameEntity: snapchat.data!, width: width,count: snapchat.data!.length,);
            }

            else{
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    
                  Text("Data not found please check your network connection",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Padding(
                      padding:  EdgeInsets.only(top: 25.0),
                      child: CircularProgressIndicator(
                      color: Colors.red,
                  ),
                    ),
                  ]
                ),
              );
            }
          }

             
      

    ));
  }
}
