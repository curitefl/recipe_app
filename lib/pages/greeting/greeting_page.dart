import 'package:flutter/material.dart';
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
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed('/${TextData.myPage}',),
                child: const Text(TextData.goToMyPage)),
          ],
        ),
      ),
    );
  }
}