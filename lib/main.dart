import 'package:flutter/material.dart';
import 'package:recipe_app/favorite_recipe_page.dart';
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
      routes: <String, WidgetBuilder> {
        '/お気に入りレシピ': (BuildContext context) => const FavoriteRecipePage(title: 'お気に入りレシピ'),
        '/コラム': (BuildContext context) => const FavoriteRecipePage(title: 'コラム'),
        '/プロフィール変更': (BuildContext context) => const FavoriteRecipePage(title: 'プロフィール変更'),
        '/メールアドレス登録': (BuildContext context) => const FavoriteRecipePage(title: 'メールアドレス登録'),
        '/冷蔵庫共有': (BuildContext context) => const FavoriteRecipePage(title: '冷蔵庫共有'),
        '/設定': (BuildContext context) => const FavoriteRecipePage(title: '設定'),
      },
    );
  }
}