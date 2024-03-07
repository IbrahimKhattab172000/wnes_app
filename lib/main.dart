import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wnes_app/business_logic/utils/firebase_messaging.dart';
import 'package:wnes_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.value([
    await EasyLocalization.ensureInitialized(),
    await Firebase.initializeApp(),
    await FirebaseMessagingUtils.instance.initNotifications(),
  ]);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/lang',
      saveLocale: true,
      startLocale: const Locale('ar'),
      child: const MyApp(),
    ),
  );
}
