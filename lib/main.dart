import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:poc_push_notifications/firebase_options.dart';
import 'package:poc_push_notifications/notifications.dart';
import 'package:poc_push_notifications/poc_push_notifications.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Notification channel for basic notifications.',
        importance: NotificationImportance.High,
      ),
    ],
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.instance.getToken().then((value) => print(value));

  FirebaseMessaging.onMessage.listen(
    (remoteMessage) {
      receiveFirebaseForegroundNotification(remoteMessage);
    },
  );

  FirebaseMessaging.onBackgroundMessage(
    receiveFirebaseBackgroundNotification,
  );

  runApp(const POCPushNotifications());
}
