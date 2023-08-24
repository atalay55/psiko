import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psiko/Database/EntityDb.dart';
import 'package:psiko/Theme/MyTextTheme.dart';
import 'package:psiko/Theme/myPopMenu.dart';
import '../../Entity/InfoEntity.dart';
import '../../Models/ZoomCubicModel.dart';

class DesktopDescriptionPage extends StatefulWidget{
  final String indexNum;
   DesktopDescriptionPage({required this.indexNum});

  @override
  State<DesktopDescriptionPage> createState() => _DesktopDescriptionPageState();

}

class _DesktopDescriptionPageState extends State<DesktopDescriptionPage> {

  late double width = MediaQuery.of(context).size.shortestSide;
  TextEditingController _controller = TextEditingController();
  var _key = GlobalKey<FormState>();
  late double fontheigth = width / 600;
  late List<String> search=[];
  late bool isSearch =false;



  @override
  Widget build(BuildContext context) {
    late bool portrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 30),
        body: FutureBuilder<InfoEntity>(
          future: EntityDb().getInfo(widget.indexNum,"AgeInformation"),
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

                      child:   BlocBuilder<ZoomCubicModel,int>(
                          builder: (context,fontsize){return Column(
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
                                        child:
                                        Text(snapshot.data!.name,
                                            style: GoogleFonts.poppins(
                                                fontSize: fontsize + 15,
                                                color: Color.fromRGBO(
                                                    140, 17, 27, 100),
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ),
                                  myPopMenu( allertDialog: allertDialog)
                                ]
                              ),
                              MyTextTheme(isSearch: isSearch, width: width, txt: snapshot.data!.p1,  fontSize: fontsize.toDouble(), seacrh: search),
                              MyTextTheme(isSearch: isSearch, width: width, txt: snapshot.data!.p2, fontSize: fontsize.toDouble(), seacrh: search),
                              MyTextTheme(isSearch: isSearch, width: width, txt: snapshot.data!.p3,  fontSize: fontsize.toDouble(), seacrh: search),
                              MyTextTheme(isSearch: isSearch, width: width, txt: snapshot.data!.p4,  fontSize: fontsize.toDouble(), seacrh: search),
                              MyTextTheme(isSearch: isSearch, width: width, txt: snapshot.data!.p5,  fontSize: fontsize.toDouble(), seacrh: search),

                            ],
                          );})
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
            ),
          );
        });
  }
}
