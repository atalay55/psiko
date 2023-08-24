import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class ZoomCubicModel extends Cubit<int>{
  ZoomCubicModel():super(20);

  void yakinlastir(){
    emit(state+5);
  }
  void uzaklastir(){
    emit(state-5);
  }
}

class SelectedCubitModel extends Cubit<String>{
  SelectedCubitModel():super("");
  late String selected="";

  void setSelected(String selected){
    this.selected=selected;
    emit(this.selected);
   // print(this.selected);
  }
  void shareSelected(){
    Share.share(selected.isNotEmpty? selected: " ");
  }


}