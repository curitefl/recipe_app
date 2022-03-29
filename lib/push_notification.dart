import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotification {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void setNotification() {
    _firebaseMessaging.getToken().then((token) {
      print("トークン：$token");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("フォアグラウンドでメッセージを受け取りました");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        // フォアグラウンドで通知を受け取った場合、通知を作成して表示する
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            const NotificationDetails(
              // 通知channelを設定する
              android: AndroidNotificationDetails(
                'like_channel', // channelId
                'あなたの投稿へのコメント', // channelName
                // 'あなたの投稿にコメントが来たら通知を受信します。', // channelDescription
                icon: 'launch_background',
              ),
            )
        );
      }
    });
  }
}