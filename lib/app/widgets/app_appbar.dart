// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wnes_app/app/widgets/app_text.dart';
import 'package:wnes_app/business_logic/helpers/colors.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  AppAppBar({
    Key? key,
    this.hMargin = 0,
    this.title,
    this.actions,
    this.leading,
    this.elevation,
  }) : super(key: key);
  final double hMargin;
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: elevation ?? 1,
      iconTheme: const IconThemeData(
        color: AppColors.secondary,
      ),
      leading: leading,
      centerTitle: true,

      // titleSpacing: title == null || title!.isEmpty || !Navigator.canPop(context) ? null : -16,
      title: AppText(
        title: title ?? '',
        fontSize: 18,
        color: AppColors.secondary,
        fontWeight: FontWeight.bold,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
