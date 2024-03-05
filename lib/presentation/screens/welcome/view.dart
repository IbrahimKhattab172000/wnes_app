import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wnes_app/app/widgets/app_button.dart';
import 'package:wnes_app/app/widgets/app_text.dart';
import 'package:wnes_app/business_logic/helpers/colors.dart';
import 'package:wnes_app/business_logic/helpers/dimentions.dart';
import 'package:wnes_app/business_logic/helpers/utils.dart';
import 'package:wnes_app/business_logic/routing/routes.dart';
import 'package:wnes_app/presentation/screens/login/view.dart';

part 'units/login_content.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                forceMaterialTransparency: true,
                backgroundColor: Colors.transparent,
                actions: [
                  Image.asset(
                    Utils.getAssetPNGPath("app_logo_icon"),
                    height: 44.height,
                    width: 44.width,
                  ),
                ],
                leading: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        Utils.getAssetPNGPath("eng_icon"),
                        height: 24.height,
                        width: 24.width,
                      ),
                    ),
                    SizedBox(width: 4.width),
                    const AppText(
                      title: "EN",
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    _LoginContent(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
