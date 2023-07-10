
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Numbers extends ChangeNotifier {

  int increment = 0;
  List<int> integers = [];

  void callBack() {

      if (increment >= 10) {
        integers.clear();
        increment = 0;
      } else {
        increment++;
        integers.add(increment);
        print(integers);
      }
    notifyListeners();
  }


}
