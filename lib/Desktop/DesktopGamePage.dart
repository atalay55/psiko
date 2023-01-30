import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DesktopGamePage extends StatefulWidget {
  late String index;
  DesktopGamePage({required this.index});

  @override
  State<DesktopGamePage> createState() => _DesktopGamePageState();
}

class _DesktopGamePageState extends State<DesktopGamePage> {

  final controller = PageController();
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  String abc="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";


  @override
  Widget build(BuildContext context) {
    late final width=MediaQuery.of(context).size.width;
print("index"+widget.index.toString());
    return Scaffold(
      body:PageView.builder(itemBuilder: (context,index){
        return SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: width,
                    child: Image.asset("images/game"+(index+1).toString()+".jpg")),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(top: width/15,left: width/40 ,right: width/40),
                        child: Text("          "+abc+abc+abc+abc+abc,style: TextStyle(fontSize: 15,height: 1.5,color: Colors.black,letterSpacing: 0.5),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },itemCount: 3,
        controller: controller,
      ),
      bottomSheet: Padding(
        padding:  EdgeInsets.only(bottom: width/8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SmoothPageIndicator(
              count: 3,
              controller: controller,
              effect: JumpingDotEffect(
                  dotWidth: width/20,
                  dotHeight: width/30,
                  verticalOffset: 20,
                  spacing: width/40
              ),
            ),
          ],
        ),
      ),

    );
  }
}
