import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'constants_manager.dart';

class AppTextStyle {
  static AppTextStyle instance = AppTextStyle();

  TextStyle displayLarge = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 57,
    fontWeight: FontWeight.bold,
    fontFamily: AppConstants.fontFamily,
  );
  TextStyle displayMedium = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 45,
    fontWeight: FontWeight.bold,
    fontFamily: AppConstants.fontFamily,
  );
  TextStyle displaySmall = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 36,
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.bold,
  );
  TextStyle headlineLarge = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 32,
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.bold,
  );
  TextStyle headlineMedium = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 28,
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.bold,
  );
  TextStyle headlineSmall = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 22,
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.bold,
  );
  TextStyle titleLarge = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.bold,
    color: AppColor.blackGrey,
    fontSize: 22,
  );
  TextStyle titleMedium = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontWeight: FontWeight.bold,
    color: AppColor.blackGrey,
    fontSize: 18,
  );
  TextStyle titleSmall = TextStyle(
    color: AppColor.blackGrey,
    fontFamily: AppConstants.fontFamily,
    fontSize: 14,
  );
  TextStyle labelLarge = TextStyle(
    color: AppColor.blackGrey,
    fontFamily: AppConstants.fontFamily,
    fontSize: 14,
  );
  TextStyle labelMedium = TextStyle(
    color: AppColor.blackGrey,
    fontFamily: AppConstants.fontFamily,
    fontSize: 12,
  );
  TextStyle labelSmall = TextStyle(
    color: AppColor.blackGrey,
    fontFamily: AppConstants.fontFamily,
    fontSize: 11,
  );
  TextStyle bodyLarge = TextStyle(
    color: AppColor.blackGrey,
    fontFamily: AppConstants.fontFamily,
    fontSize: 16,
  );
  TextStyle bodyMedium = TextStyle(
    color: AppColor.blackGrey,
    fontFamily: AppConstants.fontFamily,
    fontSize: 14,
  );
  TextStyle bodySmall = TextStyle(
    color: AppColor.blackGrey,
    fontFamily: AppConstants.fontFamily,
    fontSize: 12,
  );
}
