import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_chain_app/constants.dart';

Widget scrollAppbarScaffold({Widget? title, required Widget body}) {
  return Scaffold(
    body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            title: title,
            pinned: false,
            floating: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: InkWell(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back, color: primaryIconColor),
            ),
          ),
        ];
      },
      body: body,
    ),
  );
}
