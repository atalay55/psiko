import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psiko/Database/EntityDb.dart';
import 'package:psiko/Theme/ErrorWidgetTheme.dart';
import 'package:psiko/Theme/MyTextTheme.dart';
import 'package:psiko/controller/utilities.dart';
import '../../Entity/InfoEntity.dart';
import '../../Models/search.dart';

class MobileDescriptionPage extends StatefulWidget {
  final String indexNum;

  MobileDescriptionPage({required this.indexNum});

  @override
  State<MobileDescriptionPage> createState() => _MobileDescriptionPageState();
}

class _MobileDescriptionPageState extends State<MobileDescriptionPage> {
  late double width = MediaQuery.of(context).size.shortestSide;
  late bool isSearch = false;
  late List<String> search = [];
  late String searchText = "";
  final Utilities fontSizeCont = Get.put(Utilities());
  TextEditingController _controller = TextEditingController();
  var _key = GlobalKey<FormState>();
  String? searchedp1 = "", searchedp2 = "", searchedp3 = "", searchedp4 = "";
  List<String?> textList = []; // Tüm metin parçalarını içeren liste
  @override
  Widget build(BuildContext context) {
    late bool portrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 30), //
        appBar: AppBar(
            backgroundColor: Colors.white54,
            automaticallyImplyLeading:
                false, // Geri düğmesini otomatik olarak ekleme
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Geri düğmesine basıldığında sayfayı kapat
              },
              color: Colors.black, // Geri düğmesi rengi
            ),
            actions: [
              isSearch?IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                    });
                  },
                  icon: Icon(Icons.clear)):Text(""),
              IconButton(
                onPressed: () {
                  setState(() {
                    _showBottomSheet(context);
                  });
                },
                icon: Icon(Icons.more_vert_outlined),
                color: Colors.black,
              ),
            ]),
        body: FutureBuilder<InfoEntity>(
          future: EntityDb().getInfo(widget.indexNum, "AgeInformation"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String? p1 = snapshot.data?.p1;
              String? p2 = snapshot.data?.p2;
              String? p3 = snapshot.data?.p3;
              String? p4 = snapshot.data?.p4;

              textList = [
                isSearch ? searchedp1 : p1,
                isSearch ? searchedp2 : p2,
                isSearch ? searchedp3 : p3,
                isSearch ? searchedp4 : p4
              ];

              return Padding(
                padding: EdgeInsets.only(top: width / 40),
                child: SingleChildScrollView(
                  child: Container(
                    height: Get.height,
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
                                        padding:EdgeInsets.only(top: width / 20),
                                        child: Text(snapshot.data!.name,
                                            style: GoogleFonts.poppins(
                                                fontSize:
                                                    fontSizeCont.count.value +
                                                        12,
                                                color: Color.fromRGBO(
                                                    140, 17, 27, 100),
                                                fontWeight: FontWeight.bold))),
                                  ),
                                ),
                              ],
                            ),
                            for (var i = 0; i < textList.length; i++)
                              MyTextTheme(
                                seacrh: search,
                                isSearch: isSearch,
                                width: width,
                                txt: textList[i],
                                fontSize: fontSizeCont.count.value.toDouble(),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return ErrorWidgetTheme();
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
                        isSearch = false;
                        Navigator.pop(context);
                      });
                    },
                    child: Text("çıkış")),
                TextButton(
                    onPressed: () {
                      setState(() {
                        search.clear();
                        isSearch = true;
                        RegExp regex = RegExp(
                          _controller.text.toString().trim(),
                          caseSensitive: false,
                        );
                        String a = "";
                        List<String?> searchedTextList = [];
                        for (var i = 0; i < textList.length; i++) {
                          searchedTextList.add(
                              textList[i]?.replaceAllMapped(regex, (match) {
                                    return a = '${match.group(0)}';
                                  }) ??
                                  '');
                        }

                        search.add(a);
                        searchedp1 = searchedTextList.length > 0
                            ? searchedTextList[0]
                            : null;
                        searchedp2 = searchedTextList.length > 1
                            ? searchedTextList[1]
                            : null;
                        searchedp3 = searchedTextList.length > 2
                            ? searchedTextList[2]
                            : null;
                        searchedp4 = searchedTextList.length > 3
                            ? searchedTextList[3]
                            : null;

                        _controller.text = "";
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                    },
                    child: Text("ara")),
              ],
            ),
          );
        });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black87,
      shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)), // Köşeleri yuvarlatma
    ) ,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                ),
                title: Text("Yakınlaştır",style: TextStyle(color: Colors.white),),
                onTap: () {
                  setState(() {
                    fontSizeCont.increment();
                    Navigator.pop(context);
                  });
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.remove_circle_outline_outlined,
                  color: Colors.white,
                ),
                title: Text("Uzaklastır" ,style: TextStyle(color: Colors.white)),
                onTap: () {
                  setState(() {
                    fontSizeCont.discrement();
                    Navigator.pop(context);
                  });
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.search_off_outlined,
                  color: Colors.white,
                ),
                title: Text("Bul" ,style: TextStyle(color: Colors.white)),
                onTap: () {
                  setState(() {
                    allertDialog(context);
                  });
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.share_arrival_time_outlined,
                  color: Colors.white,
                ),
                title: Text("Paylaş" ,style: TextStyle(color: Colors.white)),
                onTap: () {
                  setState(() {
                    fontSizeCont.shareSelected();
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
