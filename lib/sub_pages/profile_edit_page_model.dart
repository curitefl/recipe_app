import 'package:flutter/cupertino.dart';

class ProfileEditPageModel extends ChangeNotifier {
  String initNickname = '';
  String initNumber = '1';
  final List<int> initDateOfBirth = [
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ];

  void setNickname(String nickname) {
    initNickname = nickname;
    notifyListeners();
  }

  void selectNumberOfPeople(String numberOfPeople) {
    initNumber = numberOfPeople;
    notifyListeners();
  }

  void selectDateOfBirth(DateTime dateOfBirth) {
    assert(initDateOfBirth.length == 3,
      'initDateOfBirthリストの要素数が変更されています（要素は3つでなければいけません）');

    initDateOfBirth[0] = dateOfBirth.year;
    initDateOfBirth[1] = dateOfBirth.month;
    initDateOfBirth[2] = dateOfBirth.day;
    notifyListeners();
  }
}