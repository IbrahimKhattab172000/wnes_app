// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wnes_app/app/widgets/app_loading_indicator.dart';
import 'package:wnes_app/app/widgets/app_text.dart';
import 'package:wnes_app/business_logic/helpers/colors.dart';
import 'package:wnes_app/business_logic/helpers/dimentions.dart';
import 'package:wnes_app/business_logic/helpers/utils.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.color = AppColors.secondary,
    this.titleColor = AppColors.white,
    this.onTap,
    this.margin = EdgeInsets.zero,
    this.padding,
    this.height,
    this.titleFontSize = 16,
    this.isLoading = false,
    this.linearColor = false,
  });

  final String title;
  final Color color;
  final Color titleColor;
  final VoidCallback? onTap;
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final double? height;
  final double titleFontSize;
  final bool isLoading;
  final bool linearColor;

  double get _radius => 12;

  factory AppButton.outline({
    required String title,
    Color borderColor = AppColors.border,
    Color titleColor = AppColors.black,
    VoidCallback? onTap,
    bool isLoading = false,
    Axis constrainedAxis = Axis.vertical,
  }) {
    return _OutlineAppButton(
      title: title,
      onTap: onTap,
      color: borderColor,
      titleColor: titleColor,
      isLoading: isLoading,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: isLoading
          ? const AppLoadingIndicator()
          : InkWell(
              onTap: () {
                if (onTap != null) {
                  onTap!();
                  Utils.dismissKeyboard();
                }
              },
              radius: _radius,
              borderRadius: BorderRadius.circular(_radius),
              child: Container(
                height: height ?? 56.height,
                padding: padding ?? EdgeInsets.symmetric(horizontal: 48.width),
                alignment: Alignment.center,
                child: AppText(
                  title: title,
                  color: titleColor,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_radius),
                  color: onTap == null ? AppColors.lightGray : color,
                  gradient: linearColor
                      ? LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: const [
                            Color(0xFF9D3ADF),
                            Color(0xFF8541D8),
                            Color(0xFF4A56C6),
                            Color(0xFF106AB6),
                          ],
                          stops: const [0.0, 0.3438, 0.6719, 1.0],
                        )
                      : null,
                ),
              ),
            ),
    );
  }
}

class _OutlineAppButton extends AppButton {
  const _OutlineAppButton({
    required super.title,
    super.onTap,
    super.color = AppColors.primary,
    super.titleColor = AppColors.secondary,
    required super.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: isLoading
          ? const AppLoadingIndicator()
          : InkWell(
              onTap: () {
                if (onTap != null) {
                  onTap!();
                  Utils.dismissKeyboard();
                }
              },
              radius: _radius,
              borderRadius: BorderRadius.circular(_radius),
              child: Container(
                height: height ?? 56.height,
                alignment: Alignment.center,
                padding: padding ?? EdgeInsets.symmetric(horizontal: 48.width),
                child: AppText(
                  title: title,
                  color: onTap == null ? AppColors.darkGray : titleColor,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w600,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_radius),
                    color: AppColors.white,
                    border: Border.all(
                      color: onTap == null ? AppColors.darkGray : color,
                      width: 1,
                    )),
              ),
            ),
    );
  }
}
