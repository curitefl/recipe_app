import 'package:flutter/material.dart';
import 'package:recipe_app/dialog_util.dart';
import 'package:recipe_app/text_data.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DialogUtil().forceUpdateDialog(context).then((needUpdate) {
      if(needUpdate) {
        return;
      }
      Navigator.of(context).pushReplacementNamed('/${TextData.signInPage}');
    });
    return const Scaffold();
  }
}
