import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationModel {
  void initFirebaseMessaging() {

    FirebaseMessaging.instance.getInitialMessage();

    ///アプリがフォアグランドにある時に呼ばれる
    ///アプリがバックグラウンドにある時に通知を受信すると
    ///端末に通知は届くが、以下の処理は呼ばれない
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
    });

    ///アプリがバックグラウンドで起動中（アプリが終了していない状態）で
    ///通知をタップすると呼び出される
    ///アプリがフォアグランドにある時は通知が来ない
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data['route'];
      print(routeFromMessage);
    });
  }
}