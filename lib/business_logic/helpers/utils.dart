import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wnes_app/business_logic/helpers/colors.dart';
import 'package:wnes_app/business_logic/helpers/dimentions.dart';
import 'package:wnes_app/business_logic/routing/routes.dart';

class Utils {
  static const String dummyProductImage =
      "https://img.freepik.com/free-vector/realistic-vector-icon-plastic-bottle-water-isolated-white-background-beverage-drink-mockup_134830-1356.jpg?size=626&ext=jpg&ga=GA1.1.1412446893.1704758400&semt=ais";

  static const String mapAPIKey = 'AIzaSyDDE5HAogSmn1mfQfqrS2yr6czG5oQCAoE';

  static Color getColor(String color) {
    final myColor = "0xff${color.replaceFirst("#", "")}";
    return Color(int.parse(myColor));
  }

  static String getAssetPNGPath(String image) {
    return 'assets/images/png/$image.png';
  }

  static String getAssetSVGPath(String image) {
    return 'assets/images/svg/$image.svg';
  }

  static double get bottomDevicePadding {
    final bottom = MediaQuery.of(RouteUtils.context).padding.bottom;
    if (bottom < 34) {
      return 34.height;
    }
    return bottom;
  }

  static double get topDevicePadding {
    final top = MediaQuery.of(RouteUtils.context).padding.top;
    if (top < 44) {
      return 44.height;
    }
    return top;
  }

  static double get appBarHeight {
    return AppBar().preferredSize.height;
  }

  static double get keyboardHeight {
    final keyboardHeight = MediaQuery.of(RouteUtils.context).viewInsets.bottom;
    if (keyboardHeight == 0) {
      return keyboardHeight;
    }
    return keyboardHeight + 16.height;
  }

  static bool get isAR {
    return RouteUtils.context.locale.languageCode == 'ar';
  }

  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String getFileNameFromURL(String url, String symbol) =>
      url.substring(url.lastIndexOf(symbol) + 1);

  static String formatDate(DateTime? value) {
    if (value == null) {
      return "";
    }
    return "${value.year}/${value.month.toString().padLeft(2, '0')}/${value.day.toString().padLeft(2, '0')}";
  }

  static String formatTime(TimeOfDay? value) {
    if (value == null) {
      return "";
    }
    final hours = value.hour;
    return '${((hours > 12) ? hours - 12 : hours == 0 ? 12 : hours).toString().padLeft(2, '0')}:${(value.minute).toString().padLeft(2, '0')} ${value.period.name.toUpperCase()}';
  }

  static TimeOfDay convertToTimeOfDay(String value) {
    List<String> timeParts = value.split(':');
    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1].split(' ')[0]);
    String period = timeParts[1].split(' ')[1];
    if (period == 'PM' && hours != 12) {
      hours += 12;
    } else if (period == 'AM' && hours == 12) {
      hours = 0;
    }
    return TimeOfDay(hour: hours, minute: minutes);
  }

  static ThemeData get datePickerTheme {
    return Theme.of(RouteUtils.context).copyWith(
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.secondary,
        onSurface: AppColors.secondary,
      ),
      textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 10,
          ),
          bodyLarge: TextStyle(
            color: AppColors.primary,
          ),
          labelSmall: TextStyle(
              color: AppColors.secondary,
              fontSize: 16,
              fontWeight: FontWeight.w700)),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
        ),
      ),
    );
  }

  static double getFileSizeInMB(File file) {
    int fileSizeInBytes = file.lengthSync();
    double fileSizeInKB = fileSizeInBytes / 1024;
    double fileSizeInMB = fileSizeInKB / 1024;
    return fileSizeInMB;
  }
}
