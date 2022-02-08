import 'package:flutter/material.dart';
import 'package:recipe_app/my_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'レシピアプリ',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyPage('マイページ'),
    );
  }
}