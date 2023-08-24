import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:psiko/Models/ZoomCubicModel.dart';
import 'package:psiko/controller/utilities.dart';
import 'package:share_plus/share_plus.dart';


class myPopMenu extends StatefulWidget {
  var allertDialog;
  myPopMenu({required this.allertDialog});

  @override
  State<myPopMenu> createState() => _myPopMenuState();
}

class _myPopMenuState extends State<myPopMenu> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 30,right: 10),
      child: PopupMenuButton(
        onSelected: (value) {
          if (value == 2) {
            widget.allertDialog(context);
          }
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
                Get.find<Utilities>().increment();
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
                Get.find<Utilities>().discrement();
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
            onTap: (){
              context.read<SelectedCubitModel>().shareSelected();
            },
          )
        ],
      ),
    );
  }

}
