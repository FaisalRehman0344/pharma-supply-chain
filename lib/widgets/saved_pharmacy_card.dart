import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';

Container pharmacyCard(var data) {
  return Container(
    margin: EdgeInsets.only(top: 12.h),
    width: 364.w,
    height: 180.h,
    padding: EdgeInsets.all(12.sp),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6.r),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 2.h),
          blurRadius: 21.r,
          color: primaryGreen.withOpacity(.16),
        )
      ],
    ),
    child: Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            height: 15,
            width: 125,
            child: Row(
              children: [
                starWidget(),
                SizedBox(width: 4.w),
                customText("(1,402)", color: starOffColor, fontSize: 10.sp)
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/Ellipse 430.png"),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText("UM Pharmacy",
                        fontSize: 14.sp, color: mainTaglineColor),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      child: customText("500M from you",
                          fontSize: 10.sp, color: subtitleTextColor),
                    ),
                    customText(
                      "UM some text are her just to show \nPharmacy",
                      fontSize: 14.sp,
                      color: subtitleTextColor,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: savedCardButtonData.map((e) {
                return cardButton(e['title'], e['icon']);
              }).toList(),
            )
          ],
        ),
      ],
    ),
  );
}

final List savedCardButtonData = [
  {"title": "View", "icon": Icons.visibility_outlined},
  {"title": "Chat", "icon": Icons.chat_outlined},
  {"title": "Call", "icon": Icons.phone_outlined},
  {"title": "Share", "icon": Icons.share_outlined},
  {"title": "Save", "icon": Icons.favorite_outline},
];

Widget cardButton(String label, IconData icon) {
  bool view = label == "View";
  return Container(
    height: 42.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6.r),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 2.h),
          blurRadius: 21.r,
          color: primaryGreen.withOpacity(.16),
        )
      ],
    ),
    child: Chip(
      labelPadding: EdgeInsets.only(left: 2.w, right: 9.sp, top: 0, bottom: 0),
      padding: EdgeInsets.symmetric(vertical: 7.sp, horizontal: 7.sp),
      backgroundColor: view ? primaryGreen : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      label: customText(label,
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: view ? Colors.white : Colors.black),
      avatar: Icon(
        icon,
        size: 14.7.w,
        color: view ? Colors.white : Colors.black,
      ),
    ),
  );
}

Widget starWidget() {
  return RatingStars(
    value: 4,
    onValueChanged: null,
    starBuilder: (index, color) => Icon(
      Icons.star,
      color: color,
      size: 15.w,
    ),
    starCount: 5,
    starSize: 15.w,
    valueLabelColor: Colors.white,
    valueLabelMargin: EdgeInsets.only(right: 4.w),
    valueLabelTextStyle: TextStyle(
      color: starOffColor,
      fontWeight: FontWeight.w400,
      fontSize: 10.sp,
    ),
    maxValue: 5,
    starSpacing: 1,
    maxValueVisibility: false,
    valueLabelVisibility: true,
    valueLabelPadding: EdgeInsets.zero,
    starOffColor: starOffColor,
    starColor: primaryGreen,
  );
}
