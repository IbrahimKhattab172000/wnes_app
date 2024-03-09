import 'package:flutter/material.dart';
import 'package:wnes_app/app/widgets/app_text.dart';
import 'package:wnes_app/business_logic/helpers/colors.dart';

class NotificationView extends StatelessWidget {
  final Map<String, dynamic> body;
  const NotificationView({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: AppText(
          title: "Just kidding",
          color: AppColors.white,
          fontSize: 40,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
