import 'base.dart';
import "dart:html";

void main(){
  var clicker = document.querySelector("#clicker");
  void onClickHandler(Event e){
    e.target.style.color = "red";
  }
  void onMouseOverHandler(Event e){
    e.target.style.background = "blue";
  }
  t(onClickHandler) | clicker.onClick.listen;

  print(1%2);

}