

import 'package:flutter/material.dart';
import 'package:psiko/Page/GamePage.dart';

import '../Page/DescriptionPage.dart';

class DescAgePage extends StatelessWidget{

  late final width;
  late List list;
  late final nameList;
  late bool isGame;
  DescAgePage({required this.width,required this.nameList,required this.list, required this.isGame});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      final isPotrait = orientation == Orientation.portrait;

      return Scaffold(
          backgroundColor: Color.fromRGBO(217, 210, 229, 100),
          body: Column(
            children: [
              Padding(
                padding: isPotrait ? EdgeInsets.only(
                    top: width / 12, right: width / 1.4, bottom: width / 20)
                    : EdgeInsets.only(
                    top: width / 12, right: width / 0.8, bottom: width / 20),
                child: Text("Yas Dönemleri", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25),),
              ),
              Flexible(child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: isPotrait ? 1 / 1.7 : 1 / 1.6,
                      mainAxisSpacing: width / 15,
                      crossAxisSpacing: width / 20
                  ),
                  padding: EdgeInsets.only(
                      left: width / 70, right: width / 70),
                  itemCount: list.length, itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {if(isGame){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (contex) =>
                            GamePage()));
                  }else {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (contex) =>
                            DescriptionPage(name: nameList[index],)));
                  }
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius
                          .circular(15)),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: isPotrait ? width / 2.5 : width / 2.1,
                            child: ClipRRect(child: Image(
                              image: AssetImage(list[index]),
                              fit: BoxFit.fill,),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: width / 40, left: width / 15),
                            child: Text(nameList[index], style: TextStyle(
                              fontSize: 15, color: Colors.black,),),
                          )
                        ],
                      )
                  ),
                );
              }))
            ],
          )
      );
    });
  }
}
