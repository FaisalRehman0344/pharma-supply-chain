import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/widgets/custom_field.dart';

SizedBox numberInputField(Map<String, String> e) {
  return SizedBox(
    height: 90.h,
    child: IntlPhoneField(
      showDropdownIcon: true,
      dropdownIconPosition: IconPosition.trailing,
      dropdownIcon: Container(
        margin: EdgeInsets.only(left: 15.sp, right: 28.sp, bottom: 8.sp),
        child: RotatedBox(
            quarterTurns: 3, child: Icon(Icons.arrow_back_ios, size: 15.w)),
      ),
      textAlignVertical: TextAlignVertical.center,
      flagsButtonMargin: EdgeInsets.only(left: 25.sp),
      disableLengthCheck: true,
      dropdownTextStyle: TextStyle(
        color: labelTextColor.withOpacity(.5),
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
      invalidNumberMessage: "Please input a valit number",
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 20.sp),
        hintStyle: TextStyle(
          color: labelTextColor.withOpacity(.5),
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        hintText: e['hint'],
        border: getInputBorder(borderColor),
        focusedBorder: getInputBorder(primaryGreen),
        errorBorder: getInputBorder(primaryGreen),
      ),
      initialCountryCode: 'US',
      onChanged: (phone) {},
    ),
  );
}
