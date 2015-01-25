import "dart:async";
import "dart:mirrors";
import "../lib/base.dart";

void main() {
  var x = new FnChainProxy();
  x("something","otherthing") | ((a,b)=>print("$a,$b"));
  var t = FnChain.instance;
  arr(a,b)=>[a,b,"c"];
  t % "a" % "b" | arr | print;
  t % "e" % "f" | arr | print;
}