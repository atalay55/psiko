import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:substring_highlight/substring_highlight.dart';

class MyTextTheme extends StatelessWidget
{
  late bool isSearch;
  late List<String> seacrh;
  late double width;
  late String ?txt;
  late String selected;
  late double dikeyFontSize;
   MyTextTheme({required this.isSearch, required this.width,
    required this.txt,required this.selected,required this.dikeyFontSize,required this.seacrh});

  @override
  Widget build(BuildContext context) {
    return isSearch? Padding(
      padding: EdgeInsets.only(
          left: 8.0, right: 8, top: width / 50),
      child: SubstringHighlight(
          caseSensitive: false,
          terms: seacrh,
          text:"          "+txt! ,
          textAlign: TextAlign.justify,
          textStyleHighlight: const TextStyle(color: Colors.red),
          textStyle: GoogleFonts.notoSerif(
              wordSpacing: 1.5,
              color: Colors.black,
              fontSize: dikeyFontSize,
              ),
          words: true),
    ) :Padding(
        padding: EdgeInsets.only(
            left: 8.0, right: 8, top: width / 50),
        child: TextSelectionTheme(
          data:const TextSelectionThemeData(
              cursorColor: Colors.blueAccent,
              selectionColor: Colors.green,
              selectionHandleColor: Colors.blueAccent),
          child: SelectableText.rich(
            showCursor: true,
            cursorRadius:const Radius.circular(20),
            cursorWidth: 3,
            textAlign: TextAlign.justify,
            scrollPhysics: const ClampingScrollPhysics(),
            onSelectionChanged: (TextSelection selection, cause) {
              selected=txt!.substring(selection.start-10,selection.end-10);

            },
            enableInteractiveSelection: true,
            toolbarOptions: const ToolbarOptions(
                copy: true, cut: true, selectAll: true),
            TextSpan(
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  height: width / 400),
              children: <TextSpan>[
                const TextSpan(text: "          "),
                TextSpan(
                    text: txt,
                    style:  GoogleFonts.notoSerif(
                      wordSpacing: 1.5,
                      color: Colors.black,
                      fontSize: dikeyFontSize,
                    ))
              ],
            ),
          ),
        ));
  }
}
