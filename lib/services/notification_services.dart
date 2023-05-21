import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

   /*initializeNotification() async {
     //tz.initializeTimeZones();
     // this is for latest iOS settings
     final DarwinInitializationSettings initializationSettingsIOS =
     DarwinInitializationSettings(
         requestSoundPermission: false,
         requestBadgePermission: false,
         requestAlertPermission: false,
         onDidReceiveLocalNotification: onDidReceiveLocalNotification
     );

     final AndroidInitializationSettings initializationSettingsAndroid =
         AndroidInitializationSettings("appicon");

       final InitializationSettings initializationSettings =
       InitializationSettings(
       iOS: initializationSettingsIOS,
       android:initializationSettingsAndroid,
     );


     await flutterLocalNotificationsPlugin.initialize(
         initializationSettings,
         onDidReceiveNotificationResponse: selectNotification
     );

   }

   void requestIOSPermissions() {
     flutterLocalNotificationsPlugin
         .resolvePlatformSpecificImplementation<
         IOSFlutterLocalNotificationsPlugin>()
         ?.requestPermissions(
       alert: true,
       badge: true,
       sound: true,
     );
   }

   Future selectNotification(String? payload) async {
     if (payload != null) {
       print('notification payload: $payload');
     } else {
       print('Notification Done');
     }
     Get.to(() => Container(color: Colors.white));
   }


   Future<dynamic> onDidReceiveLocalNotification(
       int id, String? title, String? body, String? payload) async {
     Get.dialog(const Text("Welcome to flutter"));
   }*/
}

