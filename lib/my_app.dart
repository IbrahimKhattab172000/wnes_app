import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wnes_app/business_logic/helpers/colors.dart';
import 'package:wnes_app/business_logic/helpers/pop_scaffold.dart';
import 'package:wnes_app/business_logic/routing/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:wnes_app/presentation/screens/welcome/view.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      child: const WelcomeView(),
      builder: (_, child) => KeyboardPopScaffold(
        child: MaterialApp(
          title: 'Wnes',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            hoverColor: Colors.transparent,
            useMaterial3: false,
            fontFamily: 'Tajawal',
            scaffoldBackgroundColor: AppColors.background,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            primaryColor: AppColors.primary,
          ),
          onGenerateRoute: onGenerateRoute,
          navigatorKey: navigatorKey,
          home: child,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: const [
            Locale('ar'),
            Locale('en'),
          ],
          locale: context.locale,
        ),
      ),
    );
  }
}
