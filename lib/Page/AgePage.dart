import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psiko/Page/DescriptionPage.dart';

class AgePage extends StatefulWidget {
  const AgePage({Key? key}) : super(key: key);

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  late double width= MediaQuery.of(context).size.width;
  var list=["images/resim1.jpg","images/resim2.jpg","images/resim3.jpg","images/resim4.jpg","images/resim5.jpg"];
  var nameList=["0-1 yas ","1-3 yas","3-6 yas","6-12 yas","12-18 yas"];
  @override
  void initState() {
    print(list[0]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 210, 229, 100),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top:width/8,right: width/1.8,bottom: width/20),
            child: Text("Yas Dönemleri",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
          ),
          Flexible(child:  GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 1/1.3,
              ),
              padding: EdgeInsets.only(left: width/70,right: width/70),
              itemCount: 5, itemBuilder: (BuildContext context,index){

                 return GestureDetector(
                   onTap: (){Navigator.push(context, MaterialPageRoute(builder: (contex)=>DescriptionPage(name: nameList[index],)));},
                   child: Card(
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                     color: Colors.white,
                     child:Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                          SizedBox(
                            height: width/2,
                            child: ClipRRect(child: Image.asset(list[index],fit: BoxFit.cover,),
                              borderRadius: BorderRadius.only(topLeft:Radius.circular(15),topRight: Radius.circular(15)),),
                          ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text(nameList[index],style: TextStyle(fontSize: 15,color: Colors.black,),),
                         )
                       ],
                     )
                   ),
                 );
              }))
        ],
      )
    );
  }
}
