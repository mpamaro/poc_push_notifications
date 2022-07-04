import 'package:flutter/material.dart';
import 'package:poc_push_notifications/first_page.dart';

class POCPushNotifications extends StatelessWidget {
  const POCPushNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POC Push Notifications',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
