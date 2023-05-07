import 'package:flutter/material.dart';

class AppColors {
  // ********** Colors ****************
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color brown = Colors.brown;
  static Color greyColor = Colors.grey;
  static const Color transparent = Colors.transparent;
  static Color lightGreyshade = Colors.grey.shade200;
  static Color lightPink = Colors.pink.shade50;
  // ********** Gradient Colors ****************

  static Gradient blackGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.blackColor, AppColors.blackColor]);
  static Gradient whiteGradient = LinearGradient(
      stops: const [0.0, 0.1, 0.6],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.whiteColor,
        AppColors.whiteColor.withOpacity(0.9),
        AppColors.whiteColor.withOpacity(0.05)
      ]);
}
