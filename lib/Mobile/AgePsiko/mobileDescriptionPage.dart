import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psiko/Theme/MyTextTheme.dart';
import 'package:share_plus/share_plus.dart';

import '../../Entity/InfoEntity.dart';

class MobileDescriptionPage extends StatefulWidget {
  final String indexNum;

  MobileDescriptionPage({required this.indexNum});

  @override
  State<MobileDescriptionPage> createState() => _MobileDescriptionPageState();

  FirebaseFirestore fire = FirebaseFirestore.instance;
  Future<InfoEntity> getInfo() async {
    CollectionReference ageInfo = fire.collection("AgeInformation");
    var entityInfo = ageInfo.doc(indexNum);
    var response = await entityInfo.get();
    return InfoEntity(
        name: response["name"],
        p1: response["p1"],
        p2: response["p2"],
        p3: response["p3"],
        p4: response["p4"]);
  }
}

class _MobileDescriptionPageState extends State<MobileDescriptionPage> {
  late double width = MediaQuery.of(context).size.shortestSide;
  late bool isSearch =false;
  TextEditingController _controller = TextEditingController();
  var _key = GlobalKey<FormState>();
  late double dikeyFontSize = width / 22;
  late List<String> search=[];
  late String selected="";


  @override
  Widget build(BuildContext context) {

    late bool portrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 30),
        body: FutureBuilder<InfoEntity>(
          future: widget.getInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: portrait
                    ? EdgeInsets.only(top: width / 18)
                    : EdgeInsets.only(top: width / 40),
                child: SingleChildScrollView(
                  child: InteractiveViewer(
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.0, right: 4.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Center(
                                  child: Padding(
                                    padding: portrait
                                        ? EdgeInsets.only(top: width / 20)
                                        : EdgeInsets.only(top: width / 20),
                                    child: Text(snapshot.data!.name,
                                        style: GoogleFonts.poppins(
                                            fontSize: dikeyFontSize + 12,
                                            color: Color.fromRGBO(
                                                140, 17, 27, 100),
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ), Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                ),
                                child: PopupMenuButton(
                                  onSelected: (value) {
                                    setState(() {
                                      if (value == 2) {
                                        allertDialog(context);
                                      }
                                    });
                                  },
                                  icon: Icon(Icons.more_vert_outlined),
                                  constraints: BoxConstraints.expand(
                                      width: 150, height: 200),
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      value: 0,
                                      child: Center(
                                          child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add_circle_outline),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text("Yakınlaştır"),
                                          )
                                        ],
                                      )),
                                      onTap: () {
                                        setState(() {
                                          dikeyFontSize += 5;

                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 1,
                                      child: Center(
                                          child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons
                                              .remove_circle_outline_outlined),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text("Uzaklastır"),
                                          )
                                        ],
                                      )),
                                      onTap: () {
                                        setState(() {
                                          dikeyFontSize -= 5;
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 2,
                                      child: Center(
                                          child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.search_off_outlined),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 45,
                                            ),
                                            child: Text(" Bul"),
                                          )
                                        ],
                                      )),
                                    ),
                                    PopupMenuItem(
                                      value: 3,
                                      child: Center(
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.share_arrival_time_outlined),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  right: 15,
                                                ),
                                                child: Text(" Paylaş"),
                                              )
                                            ],
                                          )),
                                      onTap: ()async{
                                        print(selected+ "selected");
                                        await Share.share(selected.isNotEmpty? selected: " ");
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          MyTextTheme(seacrh:search ,isSearch: isSearch, width: width, txt: snapshot.data!.p1,
                              selected: selected, dikeyFontSize: dikeyFontSize),
                          MyTextTheme(seacrh:search ,isSearch: isSearch, width: width, txt: snapshot.data!.p2,
                              selected: selected, dikeyFontSize: dikeyFontSize),
                          MyTextTheme(seacrh:search ,isSearch: isSearch, width: width, txt: snapshot.data!.p3,
                              selected: selected, dikeyFontSize: dikeyFontSize),
                          MyTextTheme(seacrh:search ,isSearch: isSearch, width: width, txt: snapshot.data!.p4,
                              selected: selected, dikeyFontSize: dikeyFontSize),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }

  allertDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text("Kelime ara"),
            content: Form(
              key: _key,
              child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ))),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      _controller.text = "";
                      search.clear();
                      isSearch=false;
                      Navigator.pop(context);
                    });

                  },
                  child: Text("çıkış")),
              TextButton(
                  onPressed: () {
                    setState(() {
                      search.clear();
                      isSearch=true;
                      search.add(_controller.text);
                      _controller.text = "";

                      Navigator.pop(context);
                    });
                  },
                  child: Text("ara")),
            ],
          );
        });
  }

}
