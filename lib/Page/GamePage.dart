
import 'package:flutter/material.dart';
import 'package:psiko/Desktop/DesktopGamePage.dart';
import '../Mobile/mobileGamePage.dart';


class GamePage extends StatelessWidget {

  late String index;
  GamePage({required this.index});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.shortestSide<600;
    print(isMobile.toString());
    return isMobile ? mobileGamePage(index:index )
        : DesktopGamePage(index:index ,);
  }
}

