// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import 'package:wnes_app/app/widgets/app_text.dart';
import 'package:wnes_app/business_logic/helpers/colors.dart';
import 'package:wnes_app/business_logic/helpers/dimentions.dart';
import 'package:wnes_app/business_logic/helpers/utils.dart';
import 'package:wnes_app/business_logic/routing/routes.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.child,
    required this.dismissible,
    required this.title,
  });

  final Widget child;
  final bool dismissible;
  final String title;

  static Future<dynamic> show({
    required Widget child,
    String? title,
    bool dismissible = true,
  }) {
    return showDialog(
      context: RouteUtils.context,
      barrierDismissible: false,
      // barrierColor: AppColors.secondary.withOpacity(0.7),
      builder: (context) {
        return AppDialog(
          child: child,
          dismissible: dismissible,
          title: title ?? "",
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Material(
      color: Colors.transparent,
      child: UnconstrainedBox(
        constrainedAxis: Axis.horizontal,
        child: Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: keyboardHeight,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 54.height,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: AppText(
                      title: title,
                      color: AppColors.white,
                      fontSize: 20,
                    ),
                  ),
                  if (dismissible)
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: Utils.isAR ? null : 12,
                      right: Utils.isAR ? 12 : null,
                      child: UnconstrainedBox(
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 32.height,
                            width: 32.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.white,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: AppColors.primary,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              child,
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
