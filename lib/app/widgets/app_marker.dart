import 'package:flutter/material.dart';
import 'package:wnes_app/app/widgets/app_text.dart';
import 'package:wnes_app/business_logic/helpers/colors.dart';
import 'package:wnes_app/business_logic/helpers/dimentions.dart';
import 'package:wnes_app/business_logic/helpers/utils.dart';

class AppMapMarker extends StatelessWidget {
  final String title;
  final String imagePath;
  const AppMapMarker({
    Key? key,
    this.onTap,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            Utils.getAssetPNGPath(imagePath),
            height: 64.height,
            width: 64.width,
          ),
          AppText(
            title: title,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
