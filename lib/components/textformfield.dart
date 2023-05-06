// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/fonts.dart';

class TextFormFieldW extends StatelessWidget {
  String hintText;
  // final TextEditingController controller;
  final Widget? prefixIcon;
  final FormFieldValidator? validator;
  final FormFieldValidator? onsaved;
  final FormFieldValidator? onChanged;
  final bool obscure;
  final Widget? suffixIcon;
  // final  maxlines;
  TextFormFieldW({
    super.key,
    required this.hintText,
    // required this.controller,
    this.prefixIcon,
    this.onsaved,
    this.onChanged,
    this.obscure = false,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscure,
        /*   maxLines: maxlines, */
        style: const TextStyle(
            color: AppColors.whiteColor, fontFamily: FontAssets.interFont),
        cursorColor: AppColors.whiteColor,
        keyboardType: TextInputType.emailAddress,

        // controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(8.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: AppColors.whiteColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: AppColors.whiteColor)),
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 14,
                fontFamily: FontAssets.interFont,
                color: AppColors.whiteColor),
            // labelText: "Email",
            /*  filled: true,
            fillColor: AppColors.blackColor, */
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon),
        onChanged: onChanged,
        onSaved: onsaved,
        textInputAction: TextInputAction.next,
        validator: validator);
  }
}
