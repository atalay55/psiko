
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Database/EntityDb.dart';
import '../../Entity/GameEntity.dart';
import '../../Theme/ErrorWidgetTheme.dart';
import '../../Theme/MyTextTheme.dart';
import '../../controller/utilities.dart';

class GameDescriptionPage extends StatefulWidget {

  late String dataName;
  GameDescriptionPage({required this.dataName});


  @override
  State<GameDescriptionPage> createState() => _GameDescriptionPageState();
}

class _GameDescriptionPageState extends State<GameDescriptionPage> {
  final controller = PageController();
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  late int count=3 ;
  List<GameEntity> gameEntity=[];
  final Utilities fontSizeCont = Get.put(Utilities());
  late bool isSearch = false;
  late List<String> search = [];
  late String searchText = "";
  late double width = MediaQuery.of(context).size.shortestSide;
  TextEditingController _controller = TextEditingController();
  var _key = GlobalKey<FormState>();
  final Utilities fontSizeGameCont = Get.put(Utilities());
  final height = Get.height;
  String txt="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              isSearch
                  ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                    });
                  },
                  icon: Icon(Icons.clear))
                  : Text(""),
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
      body:FutureBuilder<List<GameEntity>>(
          future: EntityDb().getGameEntity(widget.dataName+" oyunlar"),
          builder: (context, snapchat) {

            if(snapchat.hasData){
              count= snapchat.data!.length;
              gameEntity =snapchat.data!;
               return   PageView.builder(
                  itemBuilder: (context, index) {
                    txt  =gameEntity[index].Text;
                    return SingleChildScrollView(
                      child: InteractiveViewer(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    gameEntity[index].name,
                                    style: GoogleFonts.corben(
                                        fontWeight: FontWeight.bold,
                                        fontSize: fontSizeGameCont.fontSize.toDouble() + 15),
                                  ),
                                ),
                              ],
                            ),
                            (gameEntity[index].imagePath.isNotEmpty
                                ? Padding(
                              padding: EdgeInsets.only(
                                  top: height / 50,
                                  right: width / 25,
                                  left: width / 25),
                              child: SizedBox(
                                  width: width / 1.2 + fontSizeGameCont.fontSize.toDouble(),
                                  height: width / 2 +fontSizeGameCont.fontSize.toDouble(),
                                  child: Image.asset(
                                      gameEntity[index].imagePath)),
                            )
                                : ErrorWidgetTheme()),
                            MyTextTheme(
                              seacrh: search,
                              isSearch: isSearch,
                              width: width,
                              txt: txt,
                              fontSize: fontSizeCont.fontSize.value.toDouble(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  controller: controller,
                  itemCount: count);

            }

            else{
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    
                  Text("Data not found please check your network connection",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Padding(
                      padding:  EdgeInsets.only(top: 25.0),
                      child: CircularProgressIndicator(
                      color: Colors.red,
                  ),
                    ),
                  ]
                ),
              );
            }
          }
    ),
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
      )

    );
  }



  allertDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    16.0), // İstediğiniz köşe yuvarlatma değerini belirleyebilirsiniz.
              ),
              backgroundColor: Colors.black54,
              title: Text("Kelime ara", style: TextStyle(color: Colors.white)),
              content: Form(
                key: _key,
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.black54,
                            width: 2.0,
                          ))),
                  style: TextStyle(
                    color:
                    Colors.white, // Yazı rengini burada belirleyebilirsiniz
                    fontSize: 16, // Yazı boyutunu burada belirleyebilirsiniz
                    // Diğer stil özelliklerini de ekleyebilirsiniz
                  ),
                ),
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
                  child: Text("Çıkış"),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      search.clear();
                      isSearch = true;
                      String a = _controller.text.toString().trim();
                      RegExp regex = RegExp(a, caseSensitive: false);
                      String highlightedText = txt.replaceAllMapped(regex, (match) {
                        return '${match.group(0)}';
                      });
                      search.add(a);
                      txt = highlightedText;
                      _controller.text = "";
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
                  },
                  child: Text("Ara"),
                ),
              ],
            ),
          );
        });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.0)), // Köşeleri yuvarlatma
      ),
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            height: width/1.5,
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
                  title: Text(
                    "Yakınlaştır",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    setState(() {
                      fontSizeGameCont.increment();
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.remove_circle_outline_outlined,
                    color: Colors.white,
                  ),
                  title:
                  Text("Uzaklastır", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    setState(() {
                      fontSizeGameCont.discrement();
                      Navigator.pop(context);
                    });
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.search_off_outlined,
                    color: Colors.white,
                  ),
                  title: Text("Bul", style: TextStyle(color: Colors.white)),
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
                  title: Text("Paylaş", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    setState(() {
                      fontSizeGameCont.shareSelected();
                      Navigator.pop(context);
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

