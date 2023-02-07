import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../Entity/InfoEntity.dart';

class DesktopDescriptionPage extends StatefulWidget{
  final String indexNum;
   DesktopDescriptionPage({required this.indexNum});

  @override
  State<DesktopDescriptionPage> createState() => _DesktopDescriptionPageState();
  FirebaseFirestore fire = FirebaseFirestore.instance;
  Future<InfoEntity> getInfo() async {
    CollectionReference ageInfo = fire.collection("AgeInformation");
    var entityInfo = ageInfo.doc(indexNum);
    var response= await entityInfo.get();
    return InfoEntity(name: response["name"], p1:response["p1"],p2:response["p2"],
        p3:response["p3"],p4: response["p4"] );}
}

class _DesktopDescriptionPageState extends State<DesktopDescriptionPage> {

  late double width = MediaQuery.of(context).size.shortestSide;
  TextEditingController _controller = TextEditingController();
  var _key = GlobalKey<FormState>();
  late double dikeyFontSize = width / 25;
  late double fontheigth = width / 600;
  late List<String> allData = [];


  void findWord(String word) {
    allData = allData.first.toLowerCase().split(" ");
    for (String a in allData) {
      if (a == word.toLowerCase()) {
        print(allData.indexOf(word));
        continue;
      } else {
        continue;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    late String selected;
    late bool portrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 30),
        body: FutureBuilder<InfoEntity>(
          future: widget.getInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              allData.clear();
              allData.add(snapshot.data!.p1.toString());

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
                                            fontSize: dikeyFontSize + 15,
                                            color: Color.fromRGBO(
                                                140, 17, 27, 100),
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              Padding(
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
                                          print(dikeyFontSize);
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
                                        await Share.share(selected);
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 8.0, right: 8, top: width / 50),
                              child: TextSelectionTheme(
                                data: TextSelectionThemeData(
                                    cursorColor: Colors.blueAccent,
                                    selectionColor: Colors.green,
                                    selectionHandleColor: Colors.blueAccent),
                                child: SelectableText.rich(
                                  showCursor: true,
                                  cursorRadius: Radius.circular(20),
                                  cursorWidth: 3,
                                  textAlign: TextAlign.justify,
                                  onSelectionChanged: (TextSelection selection, cause) {
                                    selected="";
                                    selected=snapshot.data!.p1.substring(selection.start-10,selection.end-10);
                                  },
                                  enableInteractiveSelection: true,
                                  toolbarOptions: ToolbarOptions(
                                      copy: true, cut: true, selectAll: true),
                                  TextSpan(
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        height: width / 700),
                                    children: <TextSpan>[
                                      TextSpan(text: "          "),
                                      TextSpan(
                                          text: snapshot.data!.p1,
                                          style: GoogleFonts.notoSerif(
                                              wordSpacing: 1.5,
                                              color: Colors.black,
                                              fontSize: dikeyFontSize,
                                              height: fontheigth))
                                    ],
                                  ),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 8.0, right: 8, top: width / 50),
                              child: SelectableText.rich(
                                textAlign: TextAlign.justify,
                                showCursor: true,
                                cursorRadius: Radius.circular(5),
                                onSelectionChanged: (TextSelection selection, cause) {
                                  selected="";
                                  selected=snapshot.data!.p2!.substring(selection.start-10,selection.end-10);
                                },
                                cursorWidth: 2,
                                toolbarOptions: ToolbarOptions(
                                    copy: true, cut: true, selectAll: true),
                                TextSpan(
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      height: width / 400),
                                  children: <TextSpan>[
                                    TextSpan(text: "          "),
                                    TextSpan(
                                        text: snapshot.data!.p2,
                                        style: GoogleFonts.notoSerif(
                                            wordSpacing: 1.5,
                                            color: Colors.black,
                                            fontSize: dikeyFontSize,
                                            height: fontheigth))
                                  ],
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 8.0, right: 8, top: width / 50),
                              child: SelectableText.rich(
                                showCursor: true,
                                cursorRadius: Radius.circular(5),
                                cursorWidth: 2,
                                textAlign: TextAlign.justify,
                                onSelectionChanged: (TextSelection selection, cause) {
                                  selected="";
                                  selected=snapshot.data!.p3!.substring(selection.start-10,selection.end-10);
                                },
                                toolbarOptions: ToolbarOptions(
                                    copy: true, cut: true, selectAll: true),
                                TextSpan(
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      height: width / 400),
                                  children: <TextSpan>[
                                    TextSpan(text: "          "),
                                    TextSpan(
                                        text: snapshot.data!.p3,
                                        style: GoogleFonts.notoSerif(
                                            wordSpacing: 1.5,
                                            color: Colors.black,
                                            fontSize: dikeyFontSize,
                                            height: fontheigth))
                                  ],
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 8.0, right: 8, top: width / 50),
                              child: SelectableText.rich(
                                showCursor: true,
                                cursorRadius: Radius.circular(5),
                                cursorWidth: 2,
                                textAlign: TextAlign.justify,
                                onSelectionChanged: (TextSelection selection, cause) {
                                  selected="";
                                  selected=snapshot.data!.p4!.substring(selection.start-10,selection.end-10);
                                },
                                toolbarOptions: ToolbarOptions(
                                    copy: true, cut: true, selectAll: true),
                                TextSpan(
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      height: width / 400),
                                  children: <TextSpan>[
                                    TextSpan(text: "          "),
                                    TextSpan(
                                        text: snapshot.data!.p4,
                                        style: GoogleFonts.notoSerif(
                                            wordSpacing: 1.5,
                                            color: Colors.black,
                                            fontSize: dikeyFontSize,
                                            height: fontheigth))
                                  ],
                                ),
                              )),
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
                    _controller.text = "";
                    Navigator.pop(context);
                  },
                  child: Text("çıkış")),
              TextButton(
                  onPressed: () {
                    setState(() {
                      findWord(_controller.text);
                    });
                  },
                  child: Text("ara")),
            ],
          );
        });
  }
}
