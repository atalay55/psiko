import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class Utilities extends GetxController{
  final fontSize = 15.obs;
  increment() => fontSize.value = fontSize.value+5;
  discrement()=> fontSize.value= fontSize.value-5;


  var selected = "".obs;

  void setSelected(String selected) {
    this.selected.value = selected;
    // print(this.selected.value);
  }

  void shareSelected() {
    Share.share(selected.value.isNotEmpty ? selected.value : " ");
  }


}