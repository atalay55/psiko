import 'package:flutter/material.dart';
import 'package:psiko/Mobile/AgePsiko/mobileAgePage.dart';
import '../Desktop/AgePsiko/DescAgePage.dart';
class AgePage extends StatelessWidget {
  late bool isGame;

  AgePage({required this.isGame});


  @override
  Widget build(BuildContext context) {
    late double width = MediaQuery.of(context).size.width;

    final isMobile = MediaQuery.of(context).size.shortestSide<600;
    return isMobile ? MobileAgePage( )
        : DescAgePage(width);

    }

}





