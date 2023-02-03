import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/views/auth/admin_approve_screen.dart';
import 'package:pharma_chain_app/widgets/custom_appbar.dart';
import 'package:pharma_chain_app/widgets/custom_auth_button.dart';
import 'package:pharma_chain_app/widgets/custom_field.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';
import 'package:pharma_chain_app/widgets/scroll_glow_remover.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
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
                customText("Please enter OTP to verify your account",
                    fontSize: 20.sp),
                SizedBox(height: 23.h),
                customText(
                  "An OTP has been sent your phone number +1 352 5452 3125",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 23.h),
                customText(
                  "OTP",
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: labelTextColor,
                ),
                SizedBox(height: 7.77.h),
                customInputField(hint: " 123532", onChange: (name, val) {}),
                SizedBox(height: 40.79.h),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customAuthButton(
                          "Verify", () => Get.to(const AdminApproveScreen())),
                      SizedBox(height: 23.31.h),
                      customText(
                        "Did not recieve code?",
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: primaryGreen,
                      ),
                      SizedBox(height: 5.08.h),
                      customText(
                        "Resend OTP",
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: primaryGreen,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
