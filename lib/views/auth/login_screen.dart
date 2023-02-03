import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/views/auth/forgot_password_screen.dart';
import 'package:pharma_chain_app/views/auth/signup_screen.dart';
import 'package:pharma_chain_app/widgets/custom_auth_button.dart';
import 'package:pharma_chain_app/widgets/custom_field.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_chain_app/widgets/scroll_glow_remover.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool keepLogin = false;
  bool showPassword = false;

  void setKeepLogin(bool? val) {
    setState(() {
      keepLogin = val!;
    });
  }

  void showPass(String name) {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: GlowRemoverBehaviour(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 28.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 171.h),
                    customText("Welcome back,",
                        fontSize: 24.sp, fontWeight: FontWeight.w400),
                    SizedBox(height: 20.h),
                    customText("Private Key",
                        fontSize: 15.sp, color: labelTextColor),
                    SizedBox(height: 7.h),
                    customInputField(hint: "5465465", onChange: (name, val) {}),
                    SizedBox(height: 20.h),
                    customText("Password",
                        fontSize: 15.sp, color: labelTextColor),
                    SizedBox(height: 7.h),
                    customInputField(
                      hint: "********",
                      password: true,
                      onChange: (name, val) {},
                      showPasswordValue: showPassword,
                      showPassChangeFunction: showPass,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 13.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: keepLogin,
                        onChanged: setKeepLogin,
                        splashRadius: 0),
                    // SizedBox(width: 15.w),
                    customText("Keep me login", fontSize: 15.sp)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60.h),
                width: 320.w,
                height: 138.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customAuthButton("Login", () {}),
                    InkWell(
                      onTap: (() => Get.to(const ForgotPasswordScreen())),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 16.h),
                        child: customText(
                          "Forget password ?",
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: primaryGreen,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Create new account ? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: darkTextColor,
                        ),
                        children: [
                          TextSpan(
                            text: "Signup",
                            style: TextStyle(
                              color: primaryGreen,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(const SignupScreen()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
