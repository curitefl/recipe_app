import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationModel {
  void initFirebaseMessaging() {

    FirebaseMessaging.instance.getInitialMessage();

    ///foreground work
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
    });
  }
}