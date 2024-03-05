import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wnes_app/app/widgets/app_button.dart';
import 'package:wnes_app/app/widgets/app_country_picker.dart';
import 'package:wnes_app/app/widgets/app_text.dart';
import 'package:wnes_app/app/widgets/app_text_field.dart';
import 'package:wnes_app/business_logic/helpers/colors.dart';
import 'package:wnes_app/business_logic/helpers/dimentions.dart';
import 'package:wnes_app/business_logic/helpers/utils.dart';
import 'package:wnes_app/business_logic/routing/routes.dart';

part 'units/appbar.dart';
part 'units/login_content.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: Utils.topDevicePadding + 20),
              const _AppBar(),
              const _LoginContent(),
            ],
          ),
        ),
      ),
    );
  }
}
