// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/fonts.dart';

class ReusableButton extends StatelessWidget {
  String text;
  final VoidCallback onclick;
  final double height;
  final double width;
  final Color? color;
  final Color txtColor;
  final bool loading;

  ReusableButton({
    super.key,
    required this.text,
    required this.onclick,
    this.height = 48,
    this.width = 300,
    this.loading = false,
    this.color,
    this.txtColor = AppColors.blackColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: color,
        ),
        child: Center(
            child: loading == true
                ? const CircularProgressIndicator(
                    color: AppColors.blackColor,
                  )
                : Text(
                    text,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.interFont,
                        color: txtColor,
                        fontSize: 16),
                  )),
      ),
    );
  }
}
