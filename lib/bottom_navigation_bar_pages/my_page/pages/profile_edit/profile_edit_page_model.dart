import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/text_data.dart';

class ProfileEditPageModel extends ChangeNotifier {
  final currentUser = FirebaseAuth.instance.currentUser;
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _servingsController = TextEditingController();
  String? _dateOfBirth;

  TextEditingController getNicknameController() {
    return _nicknameController;
  }

  TextEditingController getServingsController() {
    return _servingsController;
  }

  String? getDateOfBirth() {
    return _dateOfBirth;
  }

  Future<void> fetchProfile() async {
    final uid = currentUser!.uid;
    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection(TextData.fireStoreUsers).doc(uid).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    _nicknameController.text = data[TextData.fireStoreNickname];
    _servingsController.text = data[TextData.fireStoreServings];
    _dateOfBirth = data[TextData.fireStoreDateOfBirth];
    notifyListeners();
  }

  Future<void> updateProfile() async {
    final uid = currentUser!.uid;
    await FirebaseFirestore.instance.collection(TextData.fireStoreUsers).doc(uid).update({
      TextData.fireStoreNickname: _nicknameController.text,
      TextData.fireStoreServings: _servingsController.text,
      TextData.fireStoreDateOfBirth: _dateOfBirth,
    });
  }

  void setNickname(String nickname) {
    _nicknameController.text = nickname;
    notifyListeners();
  }

  void selectServings(String servings) {
    _servingsController.text = servings;
    notifyListeners();
  }

  void selectDateOfBirth(DateTime selectedDate) {
    _dateOfBirth = '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}';
    notifyListeners();
  }
}
