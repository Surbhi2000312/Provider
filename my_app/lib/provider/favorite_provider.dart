import 'package:flutter/cupertino.dart';

class FavoriteItemProvider with ChangeNotifier{

  List<int> _selectedList = [];

  List<int> get selectedList => _selectedList;

  void addItem(int value){
    _selectedList.add(value);
    notifyListeners();
  }

  void removeItem(int value){
    _selectedList.remove(value);
    notifyListeners();
  }

}