import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppButtonStyles {
  static AppButtonStyles? _instance;
  AppButtonStyles._();

  static AppButtonStyles get i {
    _instance ??= AppButtonStyles._();
    return _instance!;
  }

  ButtonStyle get yellowButton => ElevatedButton.styleFrom(
        backgroundColor: AppColors.i.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: AppTextStyles.i.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: AppColors.i.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: AppTextStyles.i.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );
  ButtonStyle get yellowOutlinedButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: AppColors.i.yellow,
        ),
        textStyle: AppTextStyles.i.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );
  ButtonStyle get primaryOutlinedButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: AppColors.i.primary,
        ),
        textStyle: AppTextStyles.i.textSecondaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );
}

extension AppButtonStylesExtensions on BuildContext {
  AppButtonStyles get buttonStyles => AppButtonStyles.i;
}
