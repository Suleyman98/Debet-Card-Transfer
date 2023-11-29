import 'package:debet_card_transfer/app/app_assets.dart';
import 'package:flutter/material.dart';

class AppBoxDecoration {
  AppBoxDecoration._();
  static BoxDecoration get scaffoldDecoration => BoxDecoration(
      image: DecorationImage(
          image: AssetImage(
            AppAssets.scaffoldImage,
          ),
          opacity: 0.5,
          fit: BoxFit.cover));
}
