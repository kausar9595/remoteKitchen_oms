import 'dart:convert';
import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:oms/controller/auth_controller.dart';
import 'package:oms/model/order_model/order_list_model.dart';
import 'package:oms/notifications/notification_sound_controller.dart';
import 'package:oms/view/order/order_incoming/widgets/incoming_order_details.dart';
import 'package:oms/view/order/screen/orders.dart';
import 'package:permission_handler/permission_handler.dart';

import '../view/order/order_incoming/order_incoming.dart';
import 'local_notoification.dart';


class NotificationController{
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void initNotification(BuildContext context){
    print("notification FCM init ----");
    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
          (message) async{
            print("message sdfds === ${message!.data}");
            print("message sdfds === ${message.data}");
        //call the orders api
        //sound NotificationSoundController().notificationSound();
        //wait Alarm.set(alarmSettings: NotificationSoundController().notificationSound());
        print("New Notification");
        if (message.data.isNotEmpty) {
          OrderResult _orderResunt = OrderResult.fromJson(jsonDecode(message.data["order"]));
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OrderIncoming(
               orderResult: _orderResunt,
              ),
            ),
          );
        }else{
          print("No data found in the notfication body");
        }
            },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
          (message) async{
            // print("message.data === ${message.data["id"]}");
            await Alarm.set(alarmSettings: NotificationSoundController().notificationSound());
            LocalNotificationService.createanddisplaynotification(message);
            OrderResult _orderResunt = OrderResult.fromJson(jsonDecode(message.data["order"]));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OrderIncoming(
                  orderResult: _orderResunt,
                ),
              ),
            );

      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) async{
            await Alarm.set(alarmSettings: NotificationSoundController().notificationSound());

            if (message.data != null) {
          OrderResult _orderResunt = OrderResult.fromJson(jsonDecode(message.data["order"]));
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OrderIncoming(
                orderResult: _orderResunt,
              ),
            ),
          );
        }
      },
    );
  }

  Future getDeviceToken()async{
      final FirebaseMessaging _fcm = FirebaseMessaging.instance;
      final token = await _fcm.getToken();
      await AuthController.storeDeviceLocation(token.toString());
    }
 
  Future<void> requestNotificationPermissions() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    final PermissionStatus status = await Permission.notification.request();

    if (status.isGranted) {
      // Notification permissions granted
    } else if (status.isDenied) {
      // Notification permissions denied
    } else if (status.isPermanentlyDenied) {
      // Notification permissions permanently denied, open app settings
      await openAppSettings();
    }
  }



}