import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/views/auth/code_verification_screen.dart';
import 'package:pharma_chain_app/widgets/custom_appbar.dart';
import 'package:pharma_chain_app/widgets/custom_auth_button.dart';
import 'package:pharma_chain_app/widgets/custom_field.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';
import 'package:pharma_chain_app/widgets/scroll_glow_remover.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context),
      body: ScrollConfiguration(
        behavior: GlowRemoverBehaviour(),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 90.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                customText("Forgot Password",
                    fontSize: 24.sp, fontWeight: FontWeight.w400),
                SizedBox(height: 23.h),
                customText(
                  "Opps. It happens to the best of us. Input your email address to fix the issue.",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 23.h),
                customText(
                  "Email",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: labelTextColor,
                ),
                SizedBox(height: 18.h),
                customInputField(
                    hint: "abc123@gmail.com", onChange: (name, val) {}),
                SizedBox(height: 52.h),
                Align(
                  alignment: Alignment.center,
                  child: customAuthButton(
                      "Submit", () => Get.to(const CodeVerificationScreen())),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
