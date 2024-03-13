import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

SizedBox datepickerWidget(
    {required BuildContext context,
    required String labelText,
    required TextEditingController datePickController,
    required String titleText}) {
  return SizedBox(
    // width: 160.w,
    // height: 40.h,
    child: TextFormField(
      style: TextStyle(fontSize: 14.sp, height: 1),
      controller: datePickController,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 0.sp, horizontal: 10.sp),
          isDense: true,
          suffixIcon: Icon(
            Icons.calendar_today,
            size: 12.sp,
            color: Colors.grey,
        
          ),
          labelStyle: TextStyle(fontSize: 14.sp),
          border:  OutlineInputBorder(borderRadius: BorderRadius.circular(5.r)),
          label: Text(labelText)),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
        
    
            barrierDismissible: false,
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

          datePickController.text = formattedDate;
        } else {}
      },
    ),
  );
}