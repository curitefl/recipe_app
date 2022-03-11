import 'package:flutter/material.dart';

class MyPageModel extends ChangeNotifier {
  int _selectedPageIndex = 4;
  int get selectedIndex => _selectedPageIndex;
  PageController? _pageController;
  PageController? get pageController => _pageController;

  void onItemTapped (int index) {
    _selectedPageIndex = index;
    _pageController?.jumpToPage(index);
    notifyListeners();
  }

  void initPageController() {
    _pageController = PageController(initialPage: _selectedPageIndex);
    notifyListeners();
  }

  void disposePageController() {
    _pageController?.dispose();
    notifyListeners();
  }
}