import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/views/auth/login_screen.dart';
import 'package:pharma_chain_app/widgets/custom_appbar.dart';
import 'package:pharma_chain_app/widgets/custom_auth_button.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';
import 'package:pharma_chain_app/widgets/scroll_glow_remover.dart';

class SuccessMessageScreen extends StatefulWidget {
  final bool fromSignup;
  const SuccessMessageScreen({super.key, required this.fromSignup});

  @override
  State<SuccessMessageScreen> createState() => _SuccessMessageScreenState();
}

class _SuccessMessageScreenState extends State<SuccessMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context),
      body: ScrollConfiguration(
        behavior: GlowRemoverBehaviour(),
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 28.w, right: 28.w, top: 140.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16.sp),
                  width: 150.h,
                  height: 150.h,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/images/thumb_back.png"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(50.r)),
                  child: Image.asset("assets/images/thumb.png"),
                ),
                SizedBox(height: 29.h),
                SizedBox(
                  width: 314.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customText(
                        widget.fromSignup
                            ? "Registration Successful"
                            : "Password Recovery\nSuccessful",
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        lineHeight: 1.9.sp,
                        color: primaryGreen,
                      ),
                      SizedBox(height: 18.h),
                      customText(
                        widget.fromSignup
                            ? "You’ve complete registration and move to dashobard"
                            : "Return to the login screen to enter the\napplication",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        lineHeight: 1.9.sp,
                        color: primaryGreen,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 46.h),
                customAuthButton("Continue", () => Get.to(const LoginScreen()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
