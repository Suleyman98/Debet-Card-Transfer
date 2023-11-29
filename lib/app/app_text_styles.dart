import 'package:debet_card_transfer/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get boldTextWhite => TextStyle(
      fontSize: 30, fontWeight: FontWeight.w700, color: AppColors.whiteColor);
  static TextStyle get boldTextBlack => TextStyle(
      fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.black);
  static TextStyle get regularWhite =>
      TextStyle(color: AppColors.whiteColor, fontSize: 16);
      static TextStyle get regularBlack =>
      TextStyle(color: AppColors.black, fontSize: 16);
}
