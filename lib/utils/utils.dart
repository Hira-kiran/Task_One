import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constant/colors.dart';

class Utils {
  // ************** Toast ************
  void toastmsj(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.blackColor,
        textColor: AppColors.whiteColor,
        fontSize: 16.0);
  }
}

// *********** sized box *****************
extension PaddingSizedBox on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}
