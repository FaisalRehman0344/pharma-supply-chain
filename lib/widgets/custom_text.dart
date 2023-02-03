import 'package:flutter/material.dart';

Text customText(String text,
    {double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? textAlign,
    double? lineHeight}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? Colors.black,
        height: lineHeight),
    textAlign: textAlign,
  );
}
