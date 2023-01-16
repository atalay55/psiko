
import 'package:flutter/material.dart';

import '../Page/DescriptionPage.dart';
import '../Page/GamePage.dart';

class MobileAgePage extends StatelessWidget {
  late final width;
  late List list;
  late final nameList;
  late bool isGame;
  MobileAgePage(
      {required this.width, required this.list, required this.nameList,required this.isGame});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      final isPotrait = orientation == Orientation.portrait;

      return Scaffold(
          backgroundColor: isGame?Color.fromRGBO(218, 212 , 199, 10): Color.fromRGBO(217, 210, 229, 100) ,
          body: Column(
            children: [
              Padding(
                padding: isPotrait ? EdgeInsets.only(
                    top: width / 8, left: width /40,bottom: width / 20)
                    : EdgeInsets.only(
                    top: width / 12, left: width / 0.7, bottom: width / 20),
                child: Text(isGame?"Eğlence ve Oyun":"Psikolojik Yas Dönemleri", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25),),
              ),
              Flexible(child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: isPotrait ? 1 / 1.12 : 1 / 1.05,

                      mainAxisSpacing: width / 20,
                      crossAxisSpacing: width / 40
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
