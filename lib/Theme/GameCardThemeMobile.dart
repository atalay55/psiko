import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../Entity/GameEntity.dart';

class GameCardThemeMobile extends StatefulWidget {
  List<GameEntity> gameEntity;
  late int count;
  late double width;

  GameCardThemeMobile(
      {required this.gameEntity, required this.width, required this.count});

  @override
  State<GameCardThemeMobile> createState() => _GameCardThemeMobileState();
}

class _GameCardThemeMobileState extends State<GameCardThemeMobile> {
  late int count = widget.count;
  late bool isSearch= false;
  late List<String> seacrh=[];
  late double width = widget.width;
  TextEditingController _controller = TextEditingController();
  var _key = GlobalKey<FormState>();
  final controller = PageController();
  late String selected;
  late double dikeyFontSize = width / 25;

  @override
  Widget build(BuildContext context) {
    late bool portrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return portrait
        ? Scaffold(
            body: PageView.builder(
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: InteractiveViewer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: width / 10),
                                  child: Text(
                                    widget.gameEntity[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: dikeyFontSize + 20),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: width / 10, left: width / 4),
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
                                          Icon(Icons
                                              .share_arrival_time_outlined),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 15,
                                            ),
                                            child: Text(" Paylaş"),
                                          )
                                        ],
                                      )),
                                      onTap: () async {

                                        await Share.share(selected);
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          (widget.gameEntity[index].imagePath.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      top: width / 50,
                                      right: width / 25,
                                      left: width / 25),
                                  child: SizedBox(
                                      width: width / 1.2 + dikeyFontSize,
                                      height: width / 2 + dikeyFontSize,
                                      child: Image.asset(
                                          widget.gameEntity[index].imagePath)),
                                )
                              : Center(
                                  child: Padding(
                                  padding: EdgeInsets.only(top: width / 15),
                                  child: CircularProgressIndicator(
                                    color: Colors.red,
                                  ),
                                ))),
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 15,right: 15 ,bottom: 50 ,top: 10),
                              child: isSearch ?
                              SubstringHighlight(
                                  caseSensitive: false,
                                  terms: seacrh,
                                  text:widget.gameEntity[index].Text ,
                                  textAlign: TextAlign.justify,
                                  textStyleHighlight: TextStyle(color: Colors.red),
                                  textStyle: GoogleFonts.notoSerif(
                                    wordSpacing: 1.5,
                                    color: Colors.black,
                                    fontSize: dikeyFontSize,
                                  ),
                                  words: true):SelectableText(
                                  widget.gameEntity[index].Text,
                                  style:  GoogleFonts.notoSerif(
                                    wordSpacing: 1.5,
                                    color: Colors.black,
                                    fontSize: dikeyFontSize,
                                  ),
                                  textAlign: TextAlign.justify,
                                  onSelectionChanged:
                                      (TextSelection selection, cause) {
                                    setState(() {
                                      selected = "";
                                      selected = widget.gameEntity[index].Text
                                          .substring(selection.start,
                                          selection.end);
                                    });

                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                controller: controller,
                itemCount: count),
            bottomSheet: Container(
              height: width / 8,
              color: Colors.black26,
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      count: count,
                      controller: controller,
                      effect: JumpingDotEffect(
                          dotWidth: width / 20,
                          dotHeight: width / 30,
                          verticalOffset: 5,
                          spacing: width / 40),
                    ),
                  ],
                ),
              ),
            ))
        : Scaffold(
            body: PageView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: width / 10),
                              child: Text(
                                widget.gameEntity[index].name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: dikeyFontSize + 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: width / 10, left: width / 1.5),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 0,
                                  child: Center(
                                      child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                          Icons.remove_circle_outline_outlined),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  onTap: () async {
                                    await Share.share(selected);
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              (widget.gameEntity[index].imagePath.isNotEmpty
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          top: width / 50,),
                                      child: SizedBox(
                                          width: width,
                                          height: width / 1.5,
                                          child: Image.asset(widget
                                              .gameEntity[index].imagePath)),
                                    )
                                  : Center(
                                      child: Padding(
                                      padding: EdgeInsets.only(top: width / 15),
                                      child: CircularProgressIndicator(
                                        color: Colors.red,
                                      ),
                                    ))),
                              Expanded(
                                child: Container(

                                  child: SingleChildScrollView(
                                    padding: EdgeInsets.only(left: 15,right: 15, bottom: 50),
                                    child:isSearch?
                                    SubstringHighlight(
                                        caseSensitive: false,
                                        terms: seacrh,
                                        text:widget.gameEntity[index].Text ,
                                        textAlign: TextAlign.justify,
                                        textStyleHighlight: TextStyle(color: Colors.red),
                                        textStyle: GoogleFonts.notoSerif(
                                          wordSpacing: 1.1,
                                          color: Colors.black,
                                          fontSize: dikeyFontSize,
                                        ),
                                        words: true) : SelectableText(
                                          widget.gameEntity[index].Text,
                                          onSelectionChanged:
                                              (TextSelection selection, cause) {
                                            selected = "";
                                            selected = widget.gameEntity[index].Text
                                                .substring(selection.start,
                                                    selection.end);
                                          },
                                          textAlign: TextAlign.justify,
                                          style: GoogleFonts.notoSerif(
                                            wordSpacing: 1.1,
                                            color: Colors.black,
                                            fontSize: dikeyFontSize,
                                          ),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
                controller: controller,
                itemCount: count),
            bottomSheet: Container(
              color: Colors.black26,
              height: width / 10,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      count: count,
                      controller: controller,
                      effect: JumpingDotEffect(
                          dotWidth: width / 20,
                          dotHeight: width / 30,
                          verticalOffset: 20,
                          spacing: width / 40),
                    ),
                  ],
                ),
              ),
            ),
          );
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
                      seacrh.clear();
                      isSearch=false;
                      Navigator.pop(context);
                    });

                  },
                  child: Text("çıkış")),
              TextButton(
                  onPressed: () {
                    setState(() {
                      seacrh.clear();
                      isSearch=true;
                      seacrh.add(_controller.text);
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
