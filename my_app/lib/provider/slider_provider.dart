import 'package:flutter/cupertino.dart';

class SliderProvider with ChangeNotifier{

  double _value = 1.0;

  get value => _value;

  void setValue(double val){
    _value = val;
    notifyListeners();
  }
}
