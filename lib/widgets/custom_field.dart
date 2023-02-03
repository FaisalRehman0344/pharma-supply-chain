import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_chain_app/constants.dart';

SizedBox customInputField(
    {required String hint,
    bool password = false,
    required void Function(String, String) onChange,
    bool showPasswordValue = false,
    void Function(String)? showPassChangeFunction,
    double? width,
    Widget? trailing,
    bool? readonly,
    double? radius}) {
  return SizedBox(
    height: 52.h,
    width: width,
    child: TextFormField(
      readOnly: readonly ?? false,
      textAlignVertical: TextAlignVertical.center,
      onChanged: (val) => onChange(hint, val),
      obscureText: password && showPasswordValue,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
        hintText: hint,
        hintStyle: TextStyle(
          color: labelTextColor.withOpacity(.5),
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.25.sp,
        ),
        suffixIcon: password
            ? InkWell(
                onTap: () => showPassChangeFunction!(hint),
                child: showPasswordValue
                    ? Icon(Icons.visibility_off, size: 15.w)
                    : Icon(Icons.visibility, size: 15.w),
              )
            : trailing,
        border: getInputBorder(borderColor, borderRadius: radius),
        focusedBorder: getInputBorder(primaryGreen, borderRadius: radius),
        errorBorder: getInputBorder(primaryGreen, borderRadius: radius),
      ),
      validator: ((value) {
        if (value == null || value.isEmpty) {
          return "Field can not be empty";
        }
        return null;
      }),
    ),
  );
}

OutlineInputBorder getInputBorder(Color color, {double? borderRadius}) {
  return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(borderRadius ?? 6.r));
}
