import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../backend/parser/splash/splash_screen.dart';
import '../../helper/router.dart';

class SplashScreenController extends GetxController {
  final SplashScreenParser parser;
  SplashScreenController({required this.parser});
  @override
  void onInit() {
    splashDelay();
    /* initNotifications();
    FirebaseMessaging.instance.getToken().then((value) {
      log('fcm token from splash $value');
    });*/
    super.onInit();
  }

  String a = '';
  Future splashDelay() async {
    Future.delayed(const Duration(seconds: 1)).then((value) => getPage());
  }

  void getPage() {
    try {
      Get.offNamed(AppRouter.getLoginRoute());
      /* final String? token =  parser.sharedPreferencesManager.getString('accessToken');
      print("Firebase token");
      print(token);
      if (token == null) {

      } else {
        Get.offNamed(AppRouter.getBottomNavRoute());
      }*/
    } catch (e) {
      print(e);
    }
  }

  final _firebasemessageing = FirebaseMessaging.instance;
  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    "High importance Notifications",
    description: "Booking done",
    importance: Importance.defaultImportance,
  );
  final _localNotications = FlutterLocalNotificationsPlugin();
  Future<void> handleBackgroudMessage(RemoteMessage message) async {
    log("Title:${message.notification?.title}");
    log("body:${message.notification?.body}");
    log("Payload:${message.data}");
  }

  Future initLocalNotifications() async {
    const android = AndroidInitializationSettings("@drawable/app_logo");
    const settings = InitializationSettings(
      android: android,
    );
    await _localNotications.initialize(settings);
    final platform = _localNotications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((value) => handleBackgroudMessage);
    FirebaseMessaging.onMessageOpenedApp
        .listen((event) => handleBackgroudMessage);
    FirebaseMessaging.onMessage.listen((event) {
      final notification = event.notification;
      if (notification == null) return;
      _localNotications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
                _androidChannel.id, _androidChannel.name,
                channelDescription: _androidChannel.description,
                icon: '@drawable/app_logo',
                playSound: true),
          ),
          payload: jsonEncode(event.toMap()));
    });
  }

  Future<void> initNotifications() async {
    // final pref = await SharedPreferences.getInstance();
    await _firebasemessageing.requestPermission();
    final fcmToken = await _firebasemessageing.getToken();
    debugPrint("fcm token --  $fcmToken");
    await parser.sharedPreferencesManager.putString('fcm_token', fcmToken!);
    initPushNotifications();
    initLocalNotifications();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
}
//firebase user model

class person {
  String userId;
  person(this.userId);
}
