import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/screen_arguments.dart';
import 'package:recipe_app/text_data.dart';

class GreetingPage extends StatelessWidget {

  const GreetingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      body:Center(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${args.message}${TextData.welcome}',
                style: Theme.of(context).textTheme.headline2,),
            ElevatedButton(
                onPressed: () {
                    if (kDebugMode) {
                      if(Theme.of(context).platform == TargetPlatform.android){
                      print('これはアンドロイド端末だよ');
                    }
                      if(Theme.of(context).platform == TargetPlatform.iOS){
                        print('これはiOS端末だよ');
                      }
                  }
                  Navigator.of(context).pushReplacementNamed('/${TextData.myPage}',);
                },
                child: Padding(
                  padding: EdgeInsets.all(3.0.sp),
                  child: Text(TextData.goToMyPage,
                  style: Theme.of(context).textTheme.bodyText2,),
                )),
          ],
        ),
      ),
    );
  }
}