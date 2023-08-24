import 'package:flutter/material.dart';

class ErrorWidgetTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:const [
          CircularProgressIndicator(
            color: Colors.black,

          )
        ],
      ),
    );
  }
}
