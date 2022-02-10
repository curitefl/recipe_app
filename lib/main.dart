import 'package:flutter/material.dart';
import 'package:recipe_app/my_page.dart';
import 'package:recipe_app/text_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TextData.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyPage(TextData.myPage),
    );
  }
}