import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AgePage.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double width=MediaQuery.of(context).size.width;
  late double height=MediaQuery.of(context).size.height;
  @override

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
       child:ListView(
         children: [
           GestureDetector(
           onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AgePage(isGame: false,)));
      },
        child: Container(
          height: height/3,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/firstImage.jpg"),fit: BoxFit.fill)
          ),
          child: Padding(
            padding:  EdgeInsets.only(left:width/15,top:height/20),
            child: Text("Yas Dönemleri",style: GoogleFonts.arvo(color:Color.fromRGBO(160, 10, 10, 100),fontSize: 22 ,fontWeight: FontWeight.bold),),
          ),
        ),
      ),
           GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>AgePage(isGame: true,)));
             },
             child: Container(
               height: height/3,
               width: width,
               decoration: BoxDecoration(
                   image: DecorationImage(image: AssetImage("images/secondImage.jpg"),fit: BoxFit.fill)
               ),
               child: Padding(
                 padding:  EdgeInsets.only(left:width/15,top:height/20),
                 child: Text("Oyunlar",style: GoogleFonts.arvo(color:Color.fromRGBO(160, 10, 10, 100),fontSize: 22 ,fontWeight: FontWeight.bold),),
               ),
             ),
           ),
           GestureDetector(
             child: Container(
               height: height/3,
               width: width,
               decoration: BoxDecoration(
                   image: DecorationImage(image: AssetImage("images/thirdImage.jpg"),fit: BoxFit.fill)
               ),
               child: Padding(
                 padding:  EdgeInsets.only(top:width/12 ,left: width/22),
                 child: Text("Aileye Tavsiyler",style: GoogleFonts.arvo(color:Color.fromRGBO(160, 10, 10, 100),fontSize: 22 ,fontWeight: FontWeight.bold)),
               ),
             ),
           ),
         ],

       )


      )
    );
  }
}
