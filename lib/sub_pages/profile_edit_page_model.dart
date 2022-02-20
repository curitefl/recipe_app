import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProfileEditPageModel extends ChangeNotifier {
  final String _profileID = '4c7xNirdfDjfXQv0LAIH';
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _servingsController = TextEditingController();

  int? _birthYear;
  int? _birthMonth;
  int? _birthDay;

  TextEditingController getNicknameController() {
    return _nicknameController;
  }

  TextEditingController getServingsController() {
    return _servingsController;
  }

  int? getBirthYear() {
    return _birthYear;
  }

  int? getBirthMonth() {
    return _birthMonth;
  }

  int? getBirthDay() {
    return _birthDay;
  }

  Future<void> fetchProfile() async {
    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('profile').doc(_profileID).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    _nicknameController.text = data['nickname'];
    _servingsController.text = data['servings'];
    _birthYear = data['birthYear'];
    _birthMonth = data['birthMonth'];
    _birthDay = data['birthDay'];
    notifyListeners();
  }

  Future<void> updateProfile() async {
    await FirebaseFirestore.instance.collection('profile').doc(_profileID).update({
      'nickname': _nicknameController.text,
      'servings': _servingsController.text,
      'birthYear': _birthYear,
      'birthMonth': _birthMonth,
      'birthDay': _birthDay,
    });
  }

  void setNickname(String nickname) {
    _nicknameController.text = nickname;
    notifyListeners();
  }

  void selectServings(String numberOfPeople) {
    _servingsController.text = numberOfPeople;
    notifyListeners();
  }

  void selectDateOfBirth(DateTime selectedDate) {
    _birthYear = selectedDate.year;
    _birthMonth = selectedDate.month;
    _birthDay = selectedDate.day;
    notifyListeners();
  }
}
