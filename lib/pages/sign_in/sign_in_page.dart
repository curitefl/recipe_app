import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe_app/screen_arguments.dart';
import 'package:recipe_app/text_data.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
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
  User? user; // Firebaseのユーザー情報

  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ButtonTheme(
                minWidth: 350.0,
                child: ElevatedButton(
                    child: const Text(TextData.useAsGuest),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/${TextData.welcome}',
                        arguments: ScreenArguments('${TextData.guest}${TextData.honorific}',
                        ),);
                    },
                ),
              ),
              const SizedBox(height: 8.0),
              ButtonTheme(
                minWidth: 350.0,
                child: ElevatedButton(
                    child: const Text(TextData.signInWithGoogle),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
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
                        user = result?.user;
                        Navigator.pushNamed(context, '/${TextData.welcome}',
                          arguments: ScreenArguments(
                            '${user!.email}${TextData.honorific}',
                          ),);
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    }),
              ),
              const SizedBox(height: 8.0),
              ButtonTheme(
                minWidth: 350.0,
                child: ElevatedButton(
                    child: const Text(TextData.signOutOfGoogle),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      const snackBar = SnackBar(
                        content: Text(TextData.youHaveSignedOut,
                          style: TextStyle(fontWeight: FontWeight.bold),),
                        backgroundColor: Colors.grey,);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      _fireBaseAuth.signOut();
                      _googleSignIn.signOut();
                    }),
              ),
              const SizedBox(height: 8.0),
              const Text(TextData.pleaseSignOutFirst),
            ],
          ),
        ),
      ),
    );
  }
}
