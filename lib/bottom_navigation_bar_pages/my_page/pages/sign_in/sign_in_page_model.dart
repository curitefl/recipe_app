import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe_app/text_data.dart';

class SignInPageModel extends ChangeNotifier {
  
  // Google 認証
  final _googleSignIn = GoogleSignIn(scopes: [
    TextData.googleScopesEmail,
    TextData.googleScopesUrl,
  ]);
  
  GoogleSignInAccount? googleUser; // googleのアカウント情報
  GoogleSignInAuthentication? googleAuth; // googleサインイン後の認証トークンを保持する
  AuthCredential? credential; // 認証プロバイダから返される認証情報

  // Firebase 認証
  final _fireBaseAuth = FirebaseAuth.instance; // Firebase認証におけるエントリーポイント
  UserCredential? result; // Firebaseの認証要求
  User? _user; // Firebaseのユーザー情報
  User? get user => _user;

  Future<bool> signIn() async {
    // Google認証の部分
    googleUser = await _googleSignIn.signIn();
    googleAuth = await googleUser?.authentication;

    credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Google認証を通過した後、Firebase側にログイン　※emailが存在しなければ登録
    try {
      result = await _fireBaseAuth.signInWithCredential(credential!);
      _user = result?.user;
      if(result!.additionalUserInfo!.isNewUser) {
        final doc = FirebaseFirestore.instance.collection(TextData.fireStoreUsers).doc(_user!.uid);
        doc.set({
          TextData.fireStoreNickname: TextData.fireStoreInitialNickname,
          TextData.fireStoreServings: TextData.fireStoreInitialServings,
          TextData.fireStoreDateOfBirth: TextData.fireStoreInitialDateOfBirth,
        });
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future signOut () async {
    await _fireBaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}