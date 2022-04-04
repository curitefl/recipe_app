import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'main.dart';

class PushNotificationModel {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void getFirebaseMessagingToken() {
    _firebaseMessaging.getToken().then((token) {
      print("トークン：$token");
    });
  }

  void initFirebaseMessaging() {
    ///アプリケーションが終了した状態でも動作する
    ///通知をタップしたら処理が実行される
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message == null) {
        return;
      }
      final routeFromMessage = message.data['route'];
      print(routeFromMessage);
    });

    ///アプリがフォアグランドにある時に呼ばれる
    ///アプリがバックグラウンドにある時に通知を受信すると
    ///端末に通知は届くが、以下の処理は呼ばれない
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      if (notification == null) {
        return;
      }
      print(message.notification!.body);
      print(message.notification!.title);
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: 'launch_background',
            ),
          ));
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
