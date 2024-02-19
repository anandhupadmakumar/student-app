
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Loader {
  static showLoader() {
    showDialog(
      barrierDismissible: false,
        barrierColor:Colors.white.withOpacity(0.2),
        context: Get.context!,
        builder: (ctx) => Center(
              child: CircularProgressIndicator(
                strokeWidth: 3.sp,
                color: Colors.pink,
              ),
            ));
  }

  static stopLoader() {
    Get.back();
  }
}
