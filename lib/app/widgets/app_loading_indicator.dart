// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wnes_app/business_logic/helpers/dimentions.dart';
import 'package:wnes_app/business_logic/routing/routes.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  static bool _isVisible = false;
  static bool get isVisible => _isVisible;

  static Future<void> show() async {
    if (_isVisible) {
      RouteUtils.pop();
    }
    _isVisible = true;
    await showDialog(
      context: RouteUtils.context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (context) {
        return AppLoadingIndicator();
      },
    );
    _isVisible = false;
  }

  static Future<void> hide() async {
    if (!_isVisible) {
      return;
    }
    RouteUtils.pop();
    _isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Image.asset(
        'assets/images/loading.gif',
        width: 128.width,
        height: 128.height,
      ),
    );
  }
}
