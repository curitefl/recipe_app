import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../domain/profile.dart';

class ProfileEditPageModel extends ChangeNotifier {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('profile').snapshots();

  List<Profile>? profile;

  final nicknameController = TextEditingController(text: '');
  String initNumber = '1';

  final List<int> initDateOfBirth = [
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ];

  void fetchProfile() {
    _usersStream.listen((QuerySnapshot snapshot) {
      final List<Profile> profile = snapshot.docs.map((document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        final String nickname = data['nickname'];
        final String servings = data['servings'];
        return Profile(nickname, servings);
      }).toList();
      this.profile = profile;
      notifyListeners();
    });
  }

  void setNickname(String nickname) {
    nicknameController.text = nickname;
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