import 'package:flutter/material.dart';
import 'package:recipe_app/my_page.dart';
import 'package:recipe_app/text_data.dart';
import 'package:recipe_app/sub_pages/index.dart';

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
        '/${TextData.favoriteRecipe}': (BuildContext context) => const FavoriteRecipePage(title: TextData.favoriteRecipe),
        '/${TextData.columns}': (BuildContext context) => const FoundationPage(title: TextData.columns),
        '/${TextData.profileEdit}': (BuildContext context) => const ProfilePage(title: TextData.profileEdit),
        '/${TextData.mailRegistration}': (BuildContext context) => const MailRegisterPage(title: TextData.mailRegistration),
        '/${TextData.fridgeShare}': (BuildContext context) => const FridgeSharePage(title: TextData.fridgeShare),
        '/${TextData.settings}': (BuildContext context) => const SettingsPage(title: TextData.settings),
      },
    );
  }
}