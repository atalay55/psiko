import 'package:flutter/material.dart';
import 'package:psiko/Mobile/mobileDescriptionPage.dart';

import '../Desktop/DesktopDescriptionPage.dart';

class DescriptionPage extends StatelessWidget {
  late  final String indexNum;
  DescriptionPage({required this.indexNum});

  @override
  Widget build(BuildContext context) {

    final isMobile = MediaQuery.of(context).size.shortestSide<600;
    print(isMobile.toString());
      return isMobile ? MobileDescriptionPage( indexNum: indexNum,)
          : DesktopDescriptionPage(indexNum: indexNum,);
    }


}


