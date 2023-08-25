import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psiko/Entity/Entity.dart';

import '../Mobile/AgePsiko/agedescriptionpage.dart';
import '../Mobile/GamePsiko/gamedescriptionpage.dart';


class GridViewTheme extends StatelessWidget {
  late List<Entity> entities;
  late bool  isGame;
  GridViewTheme({required this.entities, required this.isGame});

  @override
  Widget build(BuildContext context) {
    var width = Get.width;
    return Expanded(
      child: GridView.builder(
          gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: width<600 ? 300 : 300  ,
              childAspectRatio:
              width<1250?(width<600 ? 1 / 1.12 : 1 / 1.25): 1/1.40,
              mainAxisSpacing: width / 20,
              crossAxisSpacing: width / 40),
          padding: EdgeInsets.only(
              left: width / 70, right: width / 70),
          itemCount:entities.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {

            Get.to(isGame? GameDescriptionPage(dataName: entities[index].name,):AgeDescriptionPage(indexNum: (index+1).toString(),));


              },
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(15)),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:width<1250 ?(width<600
                            ? width / 2.5
                            : width / 3.5): width/4.5,
                        child:entities[index]
                            .imagePath.isNotEmpty? ClipRRect(
                          child: Image(
                            width: width,
                            image: AssetImage(
                                entities[index]
                                    .imagePath),
                            fit: BoxFit.fill,
                          ),
                          borderRadius:
                          BorderRadius.only(
                              topLeft:
                              Radius.circular(
                                  15),
                              topRight:
                              Radius.circular(
                                  15)),
                        ):Center(
                          child: CircularProgressIndicator(

                            color:Colors.deepOrange ,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: width / 40,
                            left: width / 15),
                        child: Text(
                          entities[index].name,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  )),
            );
          }),
    );

  }
}
