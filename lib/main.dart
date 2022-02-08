import 'package:flutter/material.dart';
import 'package:recipe_app/sub_pages/column_page.dart';
import 'package:recipe_app/sub_pages/favorite_recipe_page.dart';
import 'package:recipe_app/my_page.dart';
import 'package:recipe_app/sub_pages/fridge_share_page.dart';
import 'package:recipe_app/sub_pages/mail_register_page.dart';
import 'package:recipe_app/sub_pages/profile_page.dart';
import 'package:recipe_app/sub_pages/settings_page.dart';
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
        '/コラム': (BuildContext context) => ColumnPage(title: 'コラム'),
        '/プロフィール変更': (BuildContext context) => const ProfilePage(title: 'プロフィール変更'),
        '/メールアドレス登録': (BuildContext context) => const MailRegisterPage(title: 'メールアドレス登録'),
        '/冷蔵庫共有': (BuildContext context) => const FridgeSharePage(title: '冷蔵庫共有'),
        '/設定': (BuildContext context) => const SettingsPage(title: '設定'),
      },
    );
  }
}