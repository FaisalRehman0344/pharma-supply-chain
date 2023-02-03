import 'package:flutter/material.dart';
import 'package:pharma_chain_app/constants.dart';

AppBar customAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 0,
    // leading: Image.asset(
    //   "assets/images/arrow_forward.png",
    //   width: 15.w,
    // ),
    iconTheme: IconThemeData(color: primaryIconColor),
  );
}
