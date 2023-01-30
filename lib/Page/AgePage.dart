import 'package:flutter/material.dart';
import 'package:psiko/Mobile/mobileAgePage.dart';
import '../Desktop/DescAgePage.dart';
class AgePage extends StatelessWidget {
  late bool isGame;

  AgePage({required this.isGame});


  @override
  Widget build(BuildContext context) {
    late double width = MediaQuery.of(context).size.width;

    final isMobile = MediaQuery.of(context).size.shortestSide<600;
    if(isGame){
    return isMobile ? MobileAgePage(  isGame: isGame,)
        : DescAgePage(width: width, isGame: isGame,);
    }else{
    return isMobile ? MobileAgePage( isGame: isGame,)
        : DescAgePage(width: width,isGame: isGame,);
    }
    }

}





