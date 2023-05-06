// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/fonts.dart';

class RoundedBtn extends StatelessWidget {
  final Color? color;
  String text;
  final BoxBorder? boxBorder;
  final Color txtColor;

  RoundedBtn({
    super.key,
    required this.text,
    this.boxBorder,
    this.color,
    this.txtColor = AppColors.blackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 64,
      decoration: BoxDecoration(
        border: boxBorder,
        borderRadius: BorderRadius.circular(70.0),
        color: color,
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: AppFonts.interFont,
            color: txtColor,
            fontSize: 16),
      )),
    );
  }
}
