import "dart:mirrors";

if2(cond)=>(a)=>(b)=>(cond)?a:b;

class FnChainProxy {
  m(args) => new FnChain(args);

  FnChainProxy() {
  }

  noSuchMethod(Invocation inv) {
    return m(inv.positionalArguments);
  }
}

class FnChain {
  List argList;

  static FnChain get instance => new FnChain([]);

  FnChain(args) {
    this.argList = args;
  }

  operator %(a){
    var newList = new List.from(argList)
      ..addAll([a]);
    return new FnChain(newList);
  }

  List returnType = ["get", "g", "return", "r"];
  List printType = ["print", "p"];
  List awaitType = ["await", "a", "get", "g"];

  operator |(f){
    if (f is String) {
      if (returnType.contains(f)) return argList[0];
      if (printType.contains(f)) {
        print(argList[0]);
        return [];
      }
    } else {
      return new FnChain([Function.apply(f, argList)]);
    }
  }

  operator [](a){
    return argList[a];
  }

  hasMethod(a, str) => reflect(a).type.instanceMembers.containsKey(new Symbol(str));

  operator +(f){
    if (hasMethod(argList[0], "then")) {
      return new FnChain([argList[0].then(f)]);
    } else if (hasMethod(f, "listen")) {
      return new FnChain([argList[0].listen(f)]);
    } else {
      return new FnChain([]);
    }
  }
}