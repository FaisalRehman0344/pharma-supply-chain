import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/views/auth/confirm_password_screen.dart';
import 'package:pharma_chain_app/widgets/custom_appbar.dart';
import 'package:pharma_chain_app/widgets/custom_auth_button.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';
import 'package:pharma_chain_app/widgets/scroll_glow_remover.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({super.key});

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  String? _code;
  bool _onEditing = false;
  bool _completed = false;

  void onComplete(String val) {
    setState(() {
      _code = val;
      _completed = true;
    });
  }

  void onEditing(bool val) {
    setState(() {
      _onEditing = val;
    });
    if (!_onEditing) FocusScope.of(context).unfocus();
  }

  Future<void> submitVerification() async {
    Get.to(const ConfirmPasswordScreen(fromSignup: false));
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
                customText("Verification Code",
                    fontSize: 24.sp, fontWeight: FontWeight.w400),
                SizedBox(height: 20.h),
                customText(
                  "Copy the verification code in your authy application to verify this account recovery",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 66.h),
                Align(
                  alignment: Alignment.center,
                  child: VerificationCode(
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      color: primaryGreen,
                      fontWeight: FontWeight.w500,
                    ),
                    keyboardType: TextInputType.number,
                    length: 5,
                    digitsOnly: true,
                    fullBorder: true,
                    cursorColor: primaryGreen,
                    onCompleted: onComplete,
                    onEditing: onEditing,
                  ),
                ),
                SizedBox(height: 66.h),
                Align(
                  alignment: Alignment.center,
                  child: customAuthButton(
                    "Submit verification",
                    _completed ? submitVerification : null,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
