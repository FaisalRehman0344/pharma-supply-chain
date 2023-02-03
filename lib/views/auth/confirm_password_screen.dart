import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/views/auth/otp_verification_screen.dart';
import 'package:pharma_chain_app/views/auth/success_message_screen.dart';
import 'package:pharma_chain_app/widgets/custom_appbar.dart';
import 'package:pharma_chain_app/widgets/custom_auth_button.dart';
import 'package:pharma_chain_app/widgets/custom_field.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';
import 'package:pharma_chain_app/widgets/scroll_glow_remover.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  final bool fromSignup;

  const ConfirmPasswordScreen({super.key, required this.fromSignup});

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {
  bool showPassword = false, showConfirm = false;

  void toogleShowPass(String name) {
    setState(() {
      if (name == "1") {
        showPassword = !showPassword;
      } else if (name == "2") {
        showConfirm = !showConfirm;
      }
    });
  }

  Future<void> submitConfirmPassword() async {
    if (widget.fromSignup) {
      Get.to(const OTPVerificationScreen());
    } else {
      Get.to(const SuccessMessageScreen(fromSignup: false));
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
            margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 86.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText("Password", fontSize: 15.sp, color: labelTextColor),
                SizedBox(height: 16.h),
                customInputField(
                    hint: "*******",
                    onChange: (name, val) {},
                    password: true,
                    showPasswordValue: showPassword,
                    showPassChangeFunction: (name) => toogleShowPass("1")),
                SizedBox(height: 42.h),
                customText("Confirm password",
                    fontSize: 15.sp, color: labelTextColor),
                SizedBox(height: 16.h),
                customInputField(
                  hint: "*******",
                  onChange: (name, val) {},
                  password: true,
                  showPasswordValue: showConfirm,
                  showPassChangeFunction: (name) => toogleShowPass("2"),
                ),
                SizedBox(height: 61.h),
                Align(
                    alignment: Alignment.center,
                    child: customAuthButton("Confirm", submitConfirmPassword))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
