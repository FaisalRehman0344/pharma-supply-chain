import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_chain_app/constants.dart';

AppBar customAppbar(BuildContext context,
    {Text? title, List<Widget>? action, double? leadingWidth}) {
  return AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 0,
    title: title,
    toolbarHeight: 110.h,
    centerTitle: true,
    iconTheme: IconThemeData(color: primaryIconColor),
    actions: action ?? const [SizedBox()],
    leadingWidth: leadingWidth ?? 90.w,
  );
}
