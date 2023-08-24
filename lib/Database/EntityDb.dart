import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psiko/Entity/Entity.dart';

import '../Entity/GameEntity.dart';
import '../Entity/InfoEntity.dart';

class EntityDb{
  FirebaseFirestore fire = FirebaseFirestore.instance;


  Future<List<Entity>> getEntity(String dbName) async {
    late List<Entity> entites = [];
    entites.clear();
    await FirebaseFirestore.instance
        .collection(dbName)
        .get()
        .then((QuerySnapshot q) {
          for( var document in q.docs){
            entites.add(Entity(name: document["name"], imagePath: document["image"]));
          }
    });
    return entites;
  }
  Future<InfoEntity> getInfo( indexNum, String dbName) async {
    CollectionReference ageInfo = fire.collection(dbName);
    var entityInfo = ageInfo.doc(indexNum);
    var response= await entityInfo.get();
    return InfoEntity(name: response["name"], p1:response["p1"],p2:response["p2"],
        p3:response["p3"], p4: response["p4"],p5: response["p4"]);}

  Future<List<GameEntity>> getGameEntity(String dbName) async {
    late List<GameEntity> games = [];
    games.clear();
    await FirebaseFirestore.instance
        .collection(dbName)
        .get()
        .then((QuerySnapshot q) {
      for( var document in q.docs){
        games.add(GameEntity(name: document["name"], imagePath: document["imagePath"], Text: document["gameText"]));
      }

    });
    return games;
  }
}