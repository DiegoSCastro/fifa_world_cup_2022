import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  AppColors._();
  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get primary => const Color(0xFF791435);
  Color get secondary => const Color(0xFFFDCE50);
  Color get yellow => const Color(0xFFFDCE50);
  Color get grey => const Color(0xFFCCCCCC);
  Color get greyDark => const Color(0xFF999999);
}

extension AppColorsExtensions on BuildContext {
  AppColors get colors => AppColors.i;
}
