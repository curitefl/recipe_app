import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProfileEditPageModel extends ChangeNotifier {
  final String profileID = '4c7xNirdfDjfXQv0LAIH';
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController servingsController = TextEditingController();
  int? birthYear;
  int? birthMonth;
  int? birthDay;

  Future <void> fetchProfile() async {
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('profile').doc(profileID).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    nicknameController.text = data['nickname'];
    servingsController.text = data['servings'];
    birthYear = data['birthYear'];
    birthMonth = data['birthMonth'];
    birthDay = data['birthDay'];
    notifyListeners();
  }

  Future <void> updateProfile() async {
    await FirebaseFirestore.instance.collection('profile').doc(profileID).update( {
      'nickname' : nicknameController.text,
      'servings' : servingsController.text,
      'birthYear' : birthYear,
      'birthMonth' : birthMonth,
      'birthDay' : birthDay,
              });
  }

  void setNickname(String nickname) {
    nicknameController.text = nickname;
    notifyListeners();
  }

  void selectServings(String numberOfPeople) {
    servingsController.text = numberOfPeople;
    notifyListeners();
  }

  void selectDateOfBirth(DateTime selectedDate) {
    birthYear = selectedDate.year;
    birthMonth = selectedDate.month;
    birthDay = selectedDate.day;
    notifyListeners();
  }
}
