import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psiko/Entity/entity.dart';
import 'package:psiko/Page/gamepage.dart';

import 'agepage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double width = Get.width;
  late double height =Get.height;
  List<Entity> entity = [
    Entity(name: "Yas Dönemleri", imagePath: "images/firstImage.jpg"),
    Entity(name: "Oyunlar", imagePath: "images/secondImage.jpg"),
    Entity(name: "Aileye Tavsiyler", imagePath: "images/thirdImage.jpg")
  ];

  Future _refresh() async {
    setState(() {

    });
    return Future.delayed(Duration(seconds: 1));
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
       child:RefreshIndicator(onRefresh:_refresh ,
         child: ListView(
           children: [
             GestureDetector(
             onTap: (){
             Get.to(AgePage());
      },
          child: Container(
            height: height/3,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(entity[0].imagePath),fit: BoxFit.fill)
            ),
            child: Padding(
              padding:  EdgeInsets.only(left:width/15,top:height/20),
              child: Text(entity[0].name,style: GoogleFonts.arvo(color:Color.fromRGBO(160, 10, 10, 100),fontSize: 22 ,fontWeight: FontWeight.bold),),
            ),
          ),
      ),
             GestureDetector(
               onTap: (){
               Get.to(GamePage());
               },
               child: Container(
                 height: height/3,
                 width: width,
                 decoration: BoxDecoration(
                     image: DecorationImage(image: AssetImage(entity[1].imagePath),fit: BoxFit.fill)
                 ),
                 child: Padding(
                   padding:  EdgeInsets.only(left:width/15,top:height/20),
                   child: Text(entity[1].name,style: GoogleFonts.arvo(color:Color.fromRGBO(160, 10, 10, 100),fontSize: 22 ,fontWeight: FontWeight.bold),),
                 ),
               ),
             ),
             GestureDetector(
               child: Container(
                 height: height/3,
                 width: width,
                 decoration: BoxDecoration(
                     image: DecorationImage(image: AssetImage(entity[2].imagePath),fit: BoxFit.fill)
                 ),
                 child: Padding(
                   padding:  EdgeInsets.only(top:width/12 ,left: width/22),
                   child: Text(entity[2].name,style: GoogleFonts.arvo(color:Color.fromRGBO(160, 10, 10, 100),fontSize: 22 ,fontWeight: FontWeight.bold)),
                 ),
               ),
             ),
           ],
         ),
       )
      )
    );
  }
}
