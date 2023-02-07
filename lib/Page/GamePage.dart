import 'package:flutter/material.dart';
import 'package:psiko/Desktop/GamePsiko/DesktopGamePage.dart';
import '../Mobile/GamePsiko/mobileGamePage.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.shortestSide < 600;
    if (isMobile) {print(isMobile);
      return mobileGamePage();
    }
    return desktopGamePage();
  }
}
