import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharma_chain_app/constants.dart';

Widget scrollAppbarScaffold({Widget? title, required Widget body}) {
  return Scaffold(
    body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            toolbarHeight: 120.h,
            title: title,
            pinned: false,
            floating: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: InkWell(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back, color: primaryIconColor),
            ),
            leadingWidth: 90.w,
          ),
        ];
      },
      body: body,
    ),
  );
}
