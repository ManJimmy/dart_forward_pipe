import "../lib/base.dart";
import "dart:async";
var x = FnChain.instance;
var t = new FnChainProxy();

void main(){
  var result = x%"hello" | ((a)=>a.toUpperCase()) | "p";
  var r = t(1,2,3) | ((a,b,c)=>a+b+c) | ((d)=>d*4) | "r";
  x%r | print;
  var f = new Future(()=>"hello future");
  x%f + ((x)=>x.toUpperCase()) + ((x)=>x.toLowerCase());

}