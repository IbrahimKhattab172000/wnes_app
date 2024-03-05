import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wnes_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.value([
    await EasyLocalization.ensureInitialized(),
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
