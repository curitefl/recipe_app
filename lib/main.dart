import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/my_page/pages/foundation/web_view/web_view_page_model.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/recipes/pages/video_page_model.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/recipes/recipe_page_model.dart';
import 'package:recipe_app/global_notification.dart';
import 'package:recipe_app/push_notification.dart';
import 'package:recipe_app/splash_page.dart';
import 'package:recipe_app/text_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/my_page/index.dart';
import 'package:recipe_app/version_check_service.dart';

Future<void> backgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
  if (kDebugMode) {
    print('バックグラウンドハンドラー通過確認');
    print(message.data.toString());
    print(message.notification!.title);
  }
}

void setupLocator() {
  getItLocator.registerLazySingleton<VersionCheckService>(() => VersionCheckService());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  androidNotificationChannel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.max,
  );
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(androidNotificationChannel);

  final PushNotification pushNotification = PushNotification();
  pushNotification.initFirebaseMessaging();
  pushNotification.getFirebaseMessagingToken();
  setupLocator();
  final checker = getItLocator<VersionCheckService>();
  checker.versionCheck();

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<FoodStuffsPageModel>(create: (context) => FoodStuffsPageModel()..initFoodStuffListForView()),
            ChangeNotifierProvider<MyPageModel>(create: (context) => MyPageModel()..initPageController()),
            ChangeNotifierProvider<ProfileEditPageModel>(create: (context) => ProfileEditPageModel()..fetchProfile()),
            ChangeNotifierProvider<SignInPageModel>(create: (context) => SignInPageModel()),
            ChangeNotifierProvider<WebViewPageModel>(create: (context) => WebViewPageModel()..isAndroid()),
            ChangeNotifierProvider<RecipePageModel>(create: (context) => RecipePageModel()),
            ChangeNotifierProvider<VideoPageModel>(create: (context) => VideoPageModel()),
          ],
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393.0, 830.0),
        builder: () => MaterialApp(
          title: TextData.appTitle,
          theme: ThemeData(
            primarySwatch: Colors.amber,
            textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 24.0.sp,
                color: Colors.black54,
              ),
              headline2: TextStyle(
                fontSize: 20.0.sp,
              ),
              headline3: TextStyle(
                fontSize: 14.0.sp,
                color: Colors.black,
              ),
              headline4: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              headline5: TextStyle(
                fontSize: 18.0.sp,
              ),
              headline6: TextStyle(
                fontSize: 10.0.sp,
              ),
              subtitle1: TextStyle(
                fontSize: 16.0.sp,
              ),
              bodyText1: TextStyle(
                fontSize: 14.0.sp,
                backgroundColor: Colors.white.withOpacity(0.7),
              ),
              button: TextStyle(
                fontSize: 12.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(
              size: 24.0.h,
            ),
          ),
          home: const SplashPage(),
          routes: <String, WidgetBuilder> {
            '/${TextData.signInPage}': (BuildContext context) => const SignInPage(),
            '/${TextData.welcome}': (BuildContext context) => const GreetingPage(),
            '/${TextData.myPage}': (BuildContext context) => MyPage(title: TextData.myPage),
            '/${TextData.favoriteRecipe}': (BuildContext context) => const FavoriteRecipePage(title: TextData.favoriteRecipe),
            '/${TextData.columns}': (BuildContext context) => const FoundationPage(title: TextData.columns),
            '/${TextData.profileEdit}': (BuildContext context) => ProfileEditPage(title: TextData.profileEdit),
            '/${TextData.mailRegistration}': (BuildContext context) => const MailRegisterPage(title: TextData.mailRegistration),
            '/${TextData.fridgeShare}': (BuildContext context) => const FridgeSharePage(title: TextData.fridgeShare),
            '/${TextData.settings}': (BuildContext context) => const SettingsPage(title: TextData.settings),
            '/${TextData.webViewPage}': (BuildContext context) => const WebViewPage(title: TextData.webViewPage),
            '/${TextData.videos}': (BuildContext context) => const VideoPage(title: TextData.videos),
          },
        )
    );
  }
}