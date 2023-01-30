import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_chain_app/constants.dart';

class SlideTile extends StatelessWidget {
  final String? imagePath, title, desc;

  const SlideTile({super.key, this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath!,
            height: 260.54.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 42.3.h),
          SizedBox(
            width: 294.w,
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 24.sp,
              ),
            ),
          ),
          SizedBox(height: 33.h),
          SizedBox(
            width: 325.w,
            child: Text(
              desc!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: secondaryTextColor,
                  height: 1.7),
            ),
          )
        ],
      ),
    );
  }
}
