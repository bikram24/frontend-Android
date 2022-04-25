import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:ecommerce_int2/screens/profile_page.dart';
import 'package:ecommerce_int2/screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:all_sensors/all_sensors.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    flutterLocalNotificationsPlugin;

void main() {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'Basic notifications',
      channelDescription: 'Basic notifications for post creation',
      defaultColor: Colors.orange,
      importance: NotificationImportance.High,
      channelShowBadge: true,
      playSound: true,
      enableLights: true,
      enableVibration: true,
      ledColor: Colors.white,
    )
  ]);
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> profilekey = GlobalKey<NavigatorState>();
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];
  @override
  void initState() {
    
    super.initState();
    _streamSubscriptions.add(proximityEvents.listen((ProximityEvent event) {
      if (event.getValue() == true) {
        profilekey.currentState?.pushNamed("/logout");
        
      }
    }));

  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eCommerce int2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Colors.transparent,
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
        
      ),
      home: SplashScreen(),
      navigatorKey: profilekey,
      routes: {
        '/checkout': (context) => ProfilePage()
      },

    );
  }
}
