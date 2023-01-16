import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psiko/Page/DescriptionPage.dart';
import 'package:psiko/Theme/mobileAgePage.dart';

import '../Theme/DescAgePage.dart';

class AgePage extends StatefulWidget {
  late bool isGame= false;
  AgePage({required this.isGame});

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  late double width = MediaQuery.of(context).size.width;
  var list = [
    "images/resim1.jpg",
    "images/resim2.jpg",
    "images/resim3.jpg",
    "images/resim4.jpg",
    "images/resim5.jpg"
  ];
  var listGame=["images/game1.jpg", "images/game2.jpg", "images/game3.jpg"];
  var nameList = ["0-1 yas ", "1-3 yas", "3-6 yas", "6-12 yas", "12-18 yas"];
  var nameListGame = [ "3-6 yas", "6-12 yas", "12-18 yas"];

  @override


  @override
  Widget build(BuildContext context) {
    final isMobie = MediaQuery.of(context).size.shortestSide<600;
    if(widget.isGame){
      return isMobie ? MobileAgePage(width: width, list: listGame, nameList: nameListGame,isGame: widget.isGame,)
          : DescAgePage(width: width, list: listGame, nameList: nameListGame,isGame: widget.isGame,);
    }else{
    return isMobie ? MobileAgePage(width: width, list: list, nameList: nameList,isGame: widget.isGame,)
        : DescAgePage(width: width, list: list, nameList: nameList,isGame: widget.isGame,);
  }
  }



}
