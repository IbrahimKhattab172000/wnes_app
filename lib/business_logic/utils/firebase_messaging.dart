import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:wnes_app/app/widgets/app_notification_dialog.dart';
import 'package:wnes_app/business_logic/routing/routes.dart';
import 'package:wnes_app/presentation/screens/notification/view.dart';

class FirebaseMessagingUtils {
  final _firebaseMessaging = FirebaseMessaging.instance;
  static FirebaseMessagingUtils instance = FirebaseMessagingUtils();

  Future<void> initNotifications() async {
    getFCMToken();
    onMessage();
    onMessageOpenedApp();
    checkIfUserClickedNotificationFromBackground();
  }

  void onMessage() {
    FirebaseMessaging.onMessage.listen((notification) {
      FlutterRingtonePlayer().play(
        android: AndroidSounds.notification,
        ios: IosSounds.glass,
        looping: false,
      );
      _handleNotificationReceiver(notification);
    });
  }

  Future<String?> getFCMToken() async {
    try {
      requestPermission();
      final fcmToken = await _firebaseMessaging.getToken();
      print("Token: $fcmToken");
      return fcmToken;
    } catch (_) {
      return '';
    }
  }

  Future<void> requestPermission() async {
    _firebaseMessaging.requestPermission();
  }

  void onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((notification) {
      RouteUtils.navigateTo(NotificationView(
        body: notification.data,
      ));
    });
  }

  void checkIfUserClickedNotificationFromBackground() async {
    final notification = await _firebaseMessaging.getInitialMessage();
    if (notification == null) {
      return;
    }
    RouteUtils.navigateAndPopAll(NotificationView(
      body: notification.data,
    ));
  }

  Future<void> _handleNotificationReceiver(RemoteMessage notification) async {
    NotificationDialog.show(
      context: RouteUtils.context,
      title: notification.notification?.title ?? '',
      body: notification.notification?.body ?? '',
    );
  }
}
