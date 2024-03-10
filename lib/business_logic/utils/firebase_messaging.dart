// import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
// import 'package:wnes_app/app/widgets/app_notification_dialog.dart';
// import 'package:wnes_app/business_logic/routing/routes.dart';
// import 'package:wnes_app/presentation/screens/notification/view.dart';

// class FirebaseMessagingUtils {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//   static FirebaseMessagingUtils instance = FirebaseMessagingUtils();
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> initNotifications() async {
//     await initLocalNotifications();

//     getFCMToken();
//     onMessage();
//     onMessageOpenedApp();
//     checkIfUserClickedNotificationFromBackground();
//   }

//   void onMessage() {
//     FirebaseMessaging.onMessage.listen((notification) {
//       FlutterRingtonePlayer().play(
//         android: AndroidSounds.notification,
//         ios: IosSounds.glass,
//         looping: false,
//       );
//       sendLocalNotification(notification);
//       _handleNotificationReceiver(notification);
//     });
//   }

//   Future<String?> getFCMToken() async {
//     try {
//       requestPermission();
//       final fcmToken = await _firebaseMessaging.getToken();
//       print("Token: $fcmToken");
//       return fcmToken;
//     } catch (_) {
//       return '';
//     }
//   }

//   Future<void> requestPermission() async {
//     _firebaseMessaging.requestPermission();
//   }

//   void onMessageOpenedApp() {
//     FirebaseMessaging.onMessageOpenedApp.listen((notification) {
//       RouteUtils.navigateTo(NotificationView(
//         body: notification.data,
//       ));
//     });
//   }

//   void checkIfUserClickedNotificationFromBackground() async {
//     final notification = await _firebaseMessaging.getInitialMessage();
//     if (notification == null) {
//       return;
//     }
//     RouteUtils.navigateAndPopAll(NotificationView(
//       body: notification.data,
//     ));
//   }

//   Future<void> _handleNotificationReceiver(RemoteMessage notification) async {
//     NotificationDialog.show(
//       context: RouteUtils.context,
//       title: notification.notification?.title ?? '',
//       body: notification.notification?.body ?? '',
//     );
//   }

//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     NotificationDialog.showIosDialog(
//         context: RouteUtils.context, title: title!, body: body!);
//   }

//   void onDidReceiveNotificationResponse(
//       NotificationResponse notificationResponse) async {
//     final String? payload = notificationResponse.payload;
//     if (notificationResponse.payload != null) {
//       print('notification payload: $payload');
//     }
//     await Navigator.push(
//       RouteUtils.context,
//       MaterialPageRoute<void>(
//         builder: (context) => const NotificationView(
//           body: {},
//         ),
//       ),
//     );
//   }

//   initLocalNotifications() async {
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()!
//         .requestNotificationsPermission();

//     NotificationSettings settings = await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: true,
//       provisional: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       sound: true,
//     );
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       await _firebaseMessaging.setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//     }

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');
//     final DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings(
//             onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//     LinuxInitializationSettings initializationSettingsLinux =
//         const LinuxInitializationSettings(
//             defaultActionName: 'Open notification');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: initializationSettingsAndroid,
//             iOS: initializationSettingsDarwin,
//             linux: initializationSettingsLinux);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: notificationTapBackground);
//   }

//   sendLocalNotification(RemoteMessage event) {
//     RemoteNotification? notification = event.notification;
//     AndroidNotification? android = event.notification?.android;
//     if (notification != null && android != null) {
//       FlutterLocalNotificationsPlugin().show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         _notificationDetails,
//         payload: jsonEncode(event.data),
//       );
//     }
//   }

//   final _notificationDetails = const NotificationDetails(
//     android: AndroidNotificationDetails(
//       'message',
//       'message',
//       importance: Importance.high,
//       playSound: true,
//       showProgress: true,
//       enableVibration: true,
//       priority: Priority.high,
//     ),
//   );
// }

// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse notificationResponse) {
//   // ignore: avoid_print
//   print('notification(${notificationResponse.id}) action tapped: '
//       '${notificationResponse.actionId} with'
//       ' payload: ${notificationResponse.payload}');
//   if (notificationResponse.input?.isNotEmpty ?? false) {
//     // ignore: avoid_print
//     print(
//         'notification action tapped with input: ${notificationResponse.input}');
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel _channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
);

AndroidInitializationSettings? _initializationSettingsAndroid;
DarwinInitializationSettings? _initializationSettingsIos;
InitializationSettings? _initializationSettings;

class NotificationHelper {
  static init() async {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_fireBaseBackgroundHandler);
    FirebaseMessaging.instance.requestPermission();
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);
    final device_id = await FirebaseMessaging.instance.getToken();
    print("FCM token :::: $device_id");
  }

  static onInit() {
    _initNotification();

    print("<<<<<<<<<<<<<<<<<<<<<< Welcome back >>>>>>>>>>>>>>>>>>>>>>");
    // FirebaseMessaging.instance.getToken().then((value) async {
    //   device_id = value;
    //   print("Device Id:::: ${value.toString()}");
    // });

    ///======================== Welcome notification ========================
    // FlutterRingtonePlayer.playNotification().then((value) => print("<<<<<<<<<<<<notification played successfully>>>>>>>>>>>>"));
    print("<<<<<<<<<<<<notification played successfully>>>>>>>>>>>>");
    // _showNotification("Consumer plus", "welcome to consumer plus");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("onMessage: $message");
      _showNotification(
          message.notification?.title, message.notification?.body);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("onLaunch: $message");
      _showNotification(
          message.notification!.title, message.notification!.body);
    });

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      print("onResume: $message");
      _showNotification(
          message.notification!.title, message.notification!.body);
    });
  }
}

/// - - - - > > methods.. < < - - - -
void _showNotification(var title, var body) async {
  await _customNotification(title, body);
}

Future<void> _customNotification(var title, var body) async {
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    'channel_ID',
    'channel_Name',
    channelDescription: 'channel_Description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'test ticker',
  );
  var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  await _flutterLocalNotificationsPlugin
      .show(0, title, body, platformChannelSpecifics, payload: 'Custom_Sound');
}

Future _initNotification() async {
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  _initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  /// < - - ICON..
  _initializationSettingsIos = const DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: false,
  );
  _initializationSettings = InitializationSettings(
      android: _initializationSettingsAndroid, iOS: _initializationSettingsIos);
  await _flutterLocalNotificationsPlugin.initialize(_initializationSettings!);
}

Future<void> _fireBaseBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}
