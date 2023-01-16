import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DescriptionPage extends StatefulWidget {
  late var name;
  DescriptionPage({required this.name});


  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  late double width=MediaQuery.of(context).size.width;
  String abc="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromRGBO(250, 250, 250, 30),
      body: Padding(
        padding: width<500? EdgeInsets.only(top: width/18):EdgeInsets.only(top: width/40),
        child: SingleChildScrollView(
          child: InteractiveViewer(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: width/16),
                  child: Text(widget.name,style: TextStyle(fontSize: 25,color: Colors.red,fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: width/30),
                  child:  Row(
                    children:  [
                      Expanded(

                        child: Padding(
                          padding: EdgeInsets.only(left:8.0,right: 8.0),
                          child: Text(abc+abc+abc+abc+abc+abc,
                            style: TextStyle(fontSize:15,color: Colors.black,height: width/440),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:8.0,right: 8.0),
                  child: RichText(

                    text: TextSpan(

                      style: TextStyle(fontSize:15,color: Colors.black,height: width/440),
                      children:  <TextSpan>[
                        TextSpan(text: abc+abc),
                        TextSpan(text: abc+abc),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:width/40),
                  child:  Row(
                    children:  [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left:8.0,right: 8.0),
                          child: Text("       "+abc+abc+abc+abc,
                            style: TextStyle(fontSize:15,height: width/440),
                            softWrap: true,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:width/40),
                  child:  Row(
                    children:  [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left:8.0,right: 8.0),
                          child: Text("      "+abc+abc+abc+abc+abc,
                            style: TextStyle(fontSize:15,height: width/440),
                            softWrap: true,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:width/40),
                  child:  Row(
                    children:  [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left:8.0,right: 8.0),
                          child: Text("       "+abc+abc+abc+abc+abc+abc,
                            style: TextStyle(fontSize:15,height:width/440),
                            softWrap: true,

                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );

  }
}
