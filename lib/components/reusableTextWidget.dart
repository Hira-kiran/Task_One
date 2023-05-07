// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:task_one/constant/colors.dart';
import 'package:task_one/constant/fonts.dart';

class ReusableTextW extends StatelessWidget {
  String text;
  final Color textClr;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;
  ReusableTextW(
      {super.key,
      this.textClr = AppColors.blackColor,
      required this.text,
      this.textAlign = TextAlign.center,
      this.fontWeight = FontWeight.w500,
      this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: textClr,
          fontSize: fontSize,
          fontFamily: AppFonts.interFont,
          fontWeight: fontWeight),
    );
  }
}
