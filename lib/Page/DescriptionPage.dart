import 'package:flutter/material.dart';
import 'package:psiko/Desktop/GamePsiko/desktopGameDescriptionPage.dart';
import 'package:psiko/Mobile/AgePsiko/mobileDescriptionPage.dart';
import 'package:psiko/Mobile/GamePsiko/mobileGameDescription.dart';

import '../Desktop/AgePsiko/DesktopDescriptionPage.dart';

class DescriptionPage extends StatelessWidget {
  late  final String indexNum;
  late final String ? dataName;
  late bool isGame;
  DescriptionPage({required this.indexNum,required this.isGame,required this.dataName});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery
        .of(context)
        .size
        .shortestSide < 600;
    if (isGame) {
      return    isMobile ? mobileGameDescription(dataName: dataName!,):desktopGameDescriptionPage(dataName: dataName!,);
    } else {
      return isMobile ? MobileDescriptionPage(indexNum: indexNum,)
          : DesktopDescriptionPage(indexNum: indexNum,);
    }
  }

}


