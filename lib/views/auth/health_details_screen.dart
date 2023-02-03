import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/views/auth/success_message_screen.dart';
import 'package:pharma_chain_app/widgets/custom_auth_button.dart';
import 'package:pharma_chain_app/widgets/custom_field.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';
import 'package:pharma_chain_app/widgets/scroll_glow_remover.dart';

import '../../widgets/custom_appbar.dart';

class HealthDetailsScreen extends StatefulWidget {
  const HealthDetailsScreen({super.key});

  @override
  State<HealthDetailsScreen> createState() => _HealthDetailsScreenState();
}

class _HealthDetailsScreenState extends State<HealthDetailsScreen> {
  String gender = "female";

  void onGenderChange(String? value) {
    if (value != null) {
      setState(() {
        gender = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context),
      body: ScrollConfiguration(
        behavior: GlowRemoverBehaviour(),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 66.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText("Patient health Details", fontSize: 20.sp),
                SizedBox(height: 11.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText("Bloog group",
                            fontSize: 15.sp, color: labelTextColor),
                        SizedBox(height: 22.h),
                        customInputField(
                            hint: "A+", onChange: (name, val) {}, width: 174.w)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText("Blood Count",
                            fontSize: 15.sp, color: labelTextColor),
                        SizedBox(height: 22.h),
                        customInputField(
                            hint: "323", onChange: (name, val) {}, width: 174.w)
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 32.h, bottom: 10.h),
                  child: customText("Gender",
                      fontSize: 15.sp, color: labelTextColor),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.sp),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 11.h),
                  width: double.infinity,
                  height: 54.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    children: [
                      Radio(
                        groupValue: gender,
                        value: "female",
                        onChanged: ((value) => onGenderChange(value)),
                      ),
                      SizedBox(width: 14.w),
                      customText(
                        "Female",
                        fontSize: 20.sp,
                        color: labelTextColor.withOpacity(.5),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.sp),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 32.h),
                  width: double.infinity,
                  height: 54.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    children: [
                      Radio(
                        groupValue: gender,
                        value: "male",
                        onChanged: ((value) => onGenderChange(value)),
                      ),
                      SizedBox(width: 14.w),
                      customText(
                        "Male",
                        fontSize: 20.sp,
                        color: labelTextColor.withOpacity(.5),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: customAuthButton(
                      "Sign Up",
                      () =>
                          Get.to(const SuccessMessageScreen(fromSignup: true))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
