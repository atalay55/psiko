import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psiko/Models/ZoomCubicModel.dart';
import 'package:psiko/Theme/ErrorWidgetTheme.dart';
import 'package:psiko/Theme/myPopMenu.dart';
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
  late bool isSearch = false;
  late List<String> seacrh = [];
  late double width = widget.width;
  TextEditingController _controller = TextEditingController();
  var _key = GlobalKey<FormState>();
  final controller = PageController();

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
                                    padding: EdgeInsets.only(
                                        top: width / 10, right: width / 5),
                                    child: BlocBuilder<ZoomCubicModel, int>(
                                        builder: (context, fontsize) {
                                      return Text(
                                        widget.gameEntity[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: fontsize + 20),
                                      );
                                    })),
                              ),
                              myPopMenu(allertDialog: allertDialog)
                            ],
                          ),
                          (widget.gameEntity[index].imagePath.isNotEmpty
                              ? BlocBuilder<ZoomCubicModel, int>(
                                  builder: (context, fontsize) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: width / 50,
                                        right: width / 25,
                                        left: width / 25),
                                    child: SizedBox(
                                        width:
                                            width / 1.2 + fontsize.toDouble(),
                                        height: width / 2 + fontsize.toDouble(),
                                        child: Image.asset(widget
                                            .gameEntity[index].imagePath)),
                                  );
                                })
                              : ErrorWidgetTheme()),
                          SingleChildScrollView(child:
                              BlocBuilder<ZoomCubicModel, int>(
                                  builder: (context, fontsize) {
                            return Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 50, top: 10),
                                child: isSearch
                                    ? SubstringHighlight(
                                        caseSensitive: false,
                                        terms: seacrh,
                                        text: widget.gameEntity[index].Text,
                                        textAlign: TextAlign.justify,
                                        textStyleHighlight:
                                            TextStyle(color: Colors.red),
                                        textStyle: GoogleFonts.notoSerif(
                                          color: Colors.black,
                                          fontSize: fontsize.toDouble() - 10,
                                        ),
                                        words: true)
                                    : SelectableText(
                                        widget.gameEntity[index].Text,
                                        style: GoogleFonts.notoSerif(
                                          color: Colors.black,
                                          fontSize: fontsize.toDouble() - 10,
                                        ),
                                        textAlign: TextAlign.justify,
                                        onSelectionChanged:
                                            (TextSelection selection, cause) {
                                        var selected = widget
                                            .gameEntity[index].Text
                                            .substring(
                                                selection.start, selection.end);
                                        print(selected);
                                        context
                                            .read<SelectedCubitModel>()
                                            .setSelected(selected);
                                      }));
                          }))
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
                              padding: EdgeInsets.only(
                                  top: width / 10, right: width / 5),
                              child: BlocBuilder<ZoomCubicModel, int>(
                                  builder: (context, fontsize) {
                                return Text(
                                  widget.gameEntity[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: fontsize.toDouble()),
                                );
                              }),
                            ),
                          ),
                          myPopMenu(allertDialog: allertDialog)
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
                                        top: width / 50,
                                      ),
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
                                child: BlocBuilder<ZoomCubicModel, int>(
                                    builder: (context, fontsize) {
                                  return Container(
                                    child: SingleChildScrollView(
                                      padding: EdgeInsets.only(
                                          left: 15, right: 15, bottom: 50),
                                      child: isSearch
                                          ? SubstringHighlight(
                                              caseSensitive: false,
                                              terms: seacrh,
                                              text:
                                                  widget.gameEntity[index].Text,
                                              textAlign: TextAlign.justify,
                                              textStyleHighlight:
                                                  TextStyle(color: Colors.red),
                                              textStyle: GoogleFonts.notoSerif(
                                                wordSpacing: 1.1,
                                                color: Colors.black,
                                                fontSize:
                                                    fontsize.toDouble() - 10,
                                              ),
                                              words: true)
                                          : SelectableText(
                                              widget.gameEntity[index].Text,
                                              onSelectionChanged:
                                                  (TextSelection selection,
                                                      cause) {
                                                var selected = widget
                                                    .gameEntity[index].Text
                                                    .substring(selection.start,
                                                        selection.end);
                                                print(selected);
                                                context
                                                    .read<SelectedCubitModel>()
                                                    .setSelected(selected);
                                              },
                                              textAlign: TextAlign.justify,
                                              style: GoogleFonts.notoSerif(
                                                wordSpacing: 1.1,
                                                color: Colors.black,
                                                fontSize:
                                                    fontsize.toDouble() - 10,
                                              ),
                                            ),
                                    ),
                                  );
                                }),
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
          return SingleChildScrollView(
            child: AlertDialog(
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
                        isSearch = false;
                        Navigator.pop(context);
                      });
                    },
                    child: Text("çıkış")),
                TextButton(
                    onPressed: () {
                      setState(() {
                        seacrh.clear();
                        isSearch = true;
                        seacrh.add(_controller.text);
                        _controller.text = "";

                        Navigator.pop(context);
                      });
                    },
                    child: Text("ara")),
              ],
            ),
          );
        });
  }
}
