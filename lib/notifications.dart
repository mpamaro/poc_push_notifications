import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> sendLocalNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: UniqueKey().hashCode,
      channelKey: 'basic_channel',
      title:
          '${Emojis.transport_air_rocket} Instant Test Notification ${Emojis.transport_air_rocket}',
      body: 'This is a instant test notification that was sent correctly.',
    ),
  );
}

Future<void> receiveFirebaseForegroundNotification(
    RemoteMessage message) async {
  final notification = message.notification;

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: UniqueKey().hashCode,
      channelKey: 'basic_channel',
      title:
          '${Emojis.wheater_fire} ${notification?.title} ${Emojis.wheater_fire}',
      body: notification?.body,
    ),
  );
}

Future<void> receiveFirebaseBackgroundNotification(
    RemoteMessage message) async {
  final notification = message.notification;

  if (notification != null) {
    final data = message.data;

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: UniqueKey().hashCode,
        channelKey: 'basic_channel',
        title: '${Emojis.wheater_fire} ${data['title']} ${Emojis.wheater_fire}',
        body: data['body'],
      ),
    );
  }
}

Future<void> sendScheduledNotification() async {
  final scheduledDate = DateTime.now().add(
    const Duration(seconds: 10),
  );

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: UniqueKey().hashCode,
      channelKey: 'basic_channel',
      title:
          '${Emojis.time_alarm_clock} Scheduled Test Notification ${Emojis.time_alarm_clock}',
      body:
          'This is a 10 second later test notification that was sent correctly.',
    ),
    schedule: NotificationCalendar(
      preciseAlarm: false,
      hour: scheduledDate.hour,
      minute: scheduledDate.minute,
      second: scheduledDate.second,
      millisecond: scheduledDate.millisecond,
    ),
  );
}
