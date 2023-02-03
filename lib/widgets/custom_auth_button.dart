import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';

TextButton customAuthButton(String text, onPressed) {
  return TextButton(
    style: TextButton.styleFrom(
        backgroundColor: primaryGreen,
        fixedSize: Size(320.w, 60.h),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r))),
    onPressed: onPressed,
    child: customText(
      text,
      fontSize: 20.sp,
      color: Colors.white,
    ),
  );
}
