import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psiko/Entity/InfoEntity.dart';



class DescriptionPage extends StatefulWidget {
  late String indexNum;


  DescriptionPage({required this.indexNum});



  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  
  late double width=MediaQuery.of(context).size.width;

  FirebaseFirestore fire = FirebaseFirestore.instance;
  Future<InfoEntity> getInfo() async {
  CollectionReference ageInfo = fire.collection("AgeInformation");
  var entityInfo = ageInfo.doc(widget.indexNum);
  var response= await entityInfo.get();
  return InfoEntity(name: response["name"], p1:response["p1"],p2:response["p2"],
      p3:response["p3"],p4: response["p4"] );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromRGBO(250, 250, 250, 30),
      body: FutureBuilder<InfoEntity>(future: getInfo(),builder: (context,snapshot){
        if(snapshot.hasData){
          return Padding(
            padding: width<500? EdgeInsets.only(top: width/18):EdgeInsets.only(top: width/40),
            child: SingleChildScrollView(
              child: InteractiveViewer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: width/20),
                        child: width<600? Text(snapshot.data!.name,style: GoogleFonts.poppins(fontSize: 25,color: Color.fromRGBO(140, 17, 27, 100),fontWeight: FontWeight.bold)):
                        Text(snapshot.data!.name,style: GoogleFonts.poppins(fontSize: width/15,color: Color.fromRGBO(140, 17, 27, 100),fontWeight: FontWeight.bold)),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left:8.0,right:8,top: width/50),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(fontSize:15,color: Colors.black,height: width/400),
                            children:  <TextSpan>[
                              TextSpan(text: "        "),
                              width<600? TextSpan(text:snapshot.data!.p1,style: GoogleFonts.notoSerif(wordSpacing: 1.5, color: Colors.black,fontSize: width/25,height: width/250)):
                              TextSpan(text:snapshot.data!.p1,style: GoogleFonts.notoSerif(wordSpacing: 1.5, color: Colors.black,fontSize: width/30,height: width/400)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:8.0,right:8,top: width/50),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(fontSize:15,color: Colors.black,height: width/400),
                            children:  <TextSpan>[
                              TextSpan(text: "        "),
                              width<600? TextSpan(text:snapshot.data!.p2,style: GoogleFonts.notoSerif(wordSpacing: 1.5, color: Colors.black,fontSize: width/25,height: width/250)):
                              TextSpan(text:snapshot.data!.p2,style: GoogleFonts.notoSerif(wordSpacing: 1.5, color: Colors.black,fontSize: width/30,height: width/400)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:8.0,right:8,top: width/50),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(fontSize:15,color: Colors.black,height: width/400),
                            children:  <TextSpan>[
                              TextSpan(text: "        "),
                              width<600? TextSpan(text:snapshot.data!.p3,style: GoogleFonts.notoSerif(wordSpacing: 1.5, color: Colors.black,fontSize: width/25,height: width/250)):
                              TextSpan(text:snapshot.data!.p3,style: GoogleFonts.notoSerif(wordSpacing: 1.5, color: Colors.black,fontSize: width/30,height: width/400)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:8.0,right:8,top: width/50),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: TextStyle(fontSize:15,color: Colors.black,height: width/400),
                            children:  <TextSpan>[
                              TextSpan(text: "        "),
                              width<600? TextSpan(text:snapshot.data!.p4,style: GoogleFonts.notoSerif(wordSpacing: 1.5, color: Colors.black,fontSize: width/25,height: width/250)):
                              TextSpan(text:snapshot.data!.p4,style: GoogleFonts.notoSerif(wordSpacing: 1.5, color: Colors.black,fontSize: width/30,height: width/400)),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        }
        else{
          return Container();
        }
        
      },)
    );

  }
}
