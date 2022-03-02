import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/pages/greeting/greeting_page.dart';
import 'package:recipe_app/pages/my_page/my_page.dart';
import 'package:recipe_app/pages/sign_in/sign_in_page.dart';
import 'package:recipe_app/text_data.dart';
import 'package:recipe_app/pages/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProfileEditPageModel()..fetchProfile(),
      child: const MyApp(),
    ),
  );
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
      home: SignInPage(),
      routes: <String, WidgetBuilder> {
        '/${TextData.welcome}': (BuildContext context) => const GreetingPage(),
        '/${TextData.myPage}': (BuildContext context) => MyPage(title: TextData.myPage),
        '/${TextData.favoriteRecipe}': (BuildContext context) => const FavoriteRecipePage(title: TextData.favoriteRecipe),
        '/${TextData.columns}': (BuildContext context) => const FoundationPage(title: TextData.columns),
        '/${TextData.profileEdit}': (BuildContext context) => ProfileEditPage(title: TextData.profileEdit),
        '/${TextData.mailRegistration}': (BuildContext context) => const MailRegisterPage(title: TextData.mailRegistration),
        '/${TextData.fridgeShare}': (BuildContext context) => const FridgeSharePage(title: TextData.fridgeShare),
        '/${TextData.settings}': (BuildContext context) => const SettingsPage(title: TextData.settings),
      },
    );
  }
}