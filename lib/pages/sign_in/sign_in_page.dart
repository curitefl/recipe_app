import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/pages/sign_in/sign_in_page_model.dart';
import 'package:recipe_app/screen_arguments.dart';
import 'package:recipe_app/text_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Consumer<SignInPageModel>(builder: (context, model, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  child: Padding(
                    padding: EdgeInsets.all(3.0.sp),
                    child: const Text(TextData.useAsGuest),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    textStyle: Theme.of(context).textTheme.button,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/${TextData.welcome}',
                      arguments: ScreenArguments(
                        '${TextData.guest}${TextData.honorific}',
                      ),
                    );
                  },
                ),
                SizedBox(height: 8.0.h),
                ButtonTheme(
                  minWidth: 350.0.w,
                  child: ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.all(3.0.w),
                        child: const Text(TextData.signInWithGoogle),
                      ),
                      style: ElevatedButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.button,
                      ),
                      onPressed: () async {
                        await model.signIn();
                        final User? user = model.user;
                        Navigator.pushNamed(
                          context,
                          '/${TextData.welcome}',
                          arguments: ScreenArguments(
                            '${user!.email}${TextData.honorific}',
                          ),
                        );
                      }),
                ),
                SizedBox(height: 8.0.h),
                ButtonTheme(
                  minWidth: 350.0.w,
                  child: ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.all(3.0.w),
                        child: const Text(TextData.signOutOfGoogle),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        onPrimary: Colors.white,
                        textStyle: Theme.of(context).textTheme.button,
                      ),
                      onPressed: () async {
                        await model.signOut();
                        const SnackBar snackBar = SnackBar(
                          content: Text(
                            TextData.youHaveSignedOut,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.grey,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }),
                ),
                SizedBox(height: 8.0.h),
                Text(
                  TextData.pleaseSignOutFirst,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
