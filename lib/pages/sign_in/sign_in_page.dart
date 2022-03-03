import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/pages/sign_in/sign_in_page_model.dart';
import 'package:recipe_app/screen_arguments.dart';
import 'package:recipe_app/text_data.dart';

class SignInPage extends StatelessWidget {

  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInPageModel>(
      create: (context) => SignInPageModel(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<SignInPageModel>(
              builder: (context, model, child) {
                return Column(
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
                          onPressed: () {
                            model.signIn(context);
                            }
                          ),
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
                            model.signOut(context);
                          }),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(TextData.pleaseSignOutFirst),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
