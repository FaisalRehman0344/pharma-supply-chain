import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/views/auth/health_details_screen.dart';
import 'package:pharma_chain_app/widgets/custom_appbar.dart';
import 'package:pharma_chain_app/widgets/custom_auth_button.dart';
import 'package:pharma_chain_app/widgets/custom_field.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';
import 'package:pharma_chain_app/widgets/scroll_glow_remover.dart';

class AdminApproveScreen extends StatefulWidget {
  const AdminApproveScreen({super.key});

  @override
  State<AdminApproveScreen> createState() => _AdminApproveScreenState();
}

class _AdminApproveScreenState extends State<AdminApproveScreen> {

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
                customText("Admin approve your account", fontSize: 20.sp),
                SizedBox(height: 11.h),
                customText(
                  "Here is you private Key",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 18.h),
                customInputField(
                    hint: " 123532", onChange: (name, val) {}, readonly: true),
                SizedBox(height: 66.h),
                Align(
                  alignment: Alignment.topCenter,
                  child: customAuthButton(
                      "Sign Up", () => Get.to(const HealthDetailsScreen())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
