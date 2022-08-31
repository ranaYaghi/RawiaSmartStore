
import 'package:flutter/material.dart';
class AppProvider extends  ChangeNotifier{
  int _selectedPageIndex = 0;

  int get  selectedPageIndex => _selectedPageIndex;

  void changeSelectedPageIndex(int index){
    _selectedPageIndex = index;
    notifyListeners();
  }
}