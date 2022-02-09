import 'package:flutter/cupertino.dart';

class ProfilePageModel extends ChangeNotifier {
  String initNumber = '1';

  void selectNumberOfPeople(String numberOfPeople) {
    initNumber = numberOfPeople;
    notifyListeners();
  }
}