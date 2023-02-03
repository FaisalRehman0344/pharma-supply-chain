import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/views/auth/confirm_password_screen.dart';
import 'package:pharma_chain_app/widgets/custom_auth_button.dart';
import 'package:pharma_chain_app/widgets/custom_field.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';
import 'package:pharma_chain_app/widgets/number_input_field.dart';
import 'package:pharma_chain_app/widgets/screll_appbar_scaffold.dart';
import 'package:pharma_chain_app/widgets/scroll_glow_remover.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool agreed = false;
  String pickedDate = "";

  List<Map<String, String>> fieldData = [
    {"label": "Phone no", "hint": "123456789"},
    {"label": "Email", "hint": "abc123@gmail.com"},
    {"label": "Date of birth", "hint": "12 - 09 - 2022"},
    {"label": "Country", "hint": "Pakistan"},
    {"label": "State", "hint": "Pubjab"},
  ];

  void changeAgreed(bool? val) {
    setState(() {
      agreed = val!;
    });
  }

  void pickDate() async {
    final DateTime? picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990, 1, 1),
      lastDate: DateTime.now(),
    );
    if (picker != null) {
      setState(() {
        pickedDate = "${picker.day} - ${picker.month} - ${picker.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return scrollAppbarScaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: GlowRemoverBehaviour(),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                  left: 28.w, right: 28.w, top: 75.h, bottom: 96.h),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText("Patient Registeration",
                        fontSize: 24.sp, fontWeight: FontWeight.w400),
                    SizedBox(height: 11.h),
                    //First name and last name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText("First name",
                                fontSize: 15.sp, color: labelTextColor),
                            SizedBox(height: 22.h),
                            customInputField(
                                hint: "Aqib",
                                onChange: (name, val) {},
                                width: 174.w)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText("Last name",
                                fontSize: 15.sp, color: labelTextColor),
                            SizedBox(height: 22.h),
                            customInputField(
                                hint: "Javid",
                                onChange: (name, val) {},
                                width: 174.w)
                          ],
                        ),
                      ],
                    ),

                    ...fieldData.map((e) {
                      if (e['label'] == "Phone no") {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedLabelText(e['label']!),
                            numberInputField(e),
                          ],
                        );
                      } else if (e['label'] == "Date of birth") {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedLabelText(e['label']!),
                            datePickerField(e)
                          ],
                        );
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizedLabelText(e['label']!),
                          customInputField(
                            hint: e['hint']!,
                            onChange: (name, val) {},
                          ),
                        ],
                      );
                    }).toList(),

                    //City and Zip code
                    SizedBox(height: 23.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText("City",
                                fontSize: 15.sp, color: labelTextColor),
                            SizedBox(height: 22.h),
                            customInputField(
                                hint: "Lahore",
                                onChange: (name, val) {},
                                width: 174.w)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText("Zip code",
                                fontSize: 15.sp, color: labelTextColor),
                            SizedBox(height: 22.h),
                            customInputField(
                                hint: "123456",
                                onChange: (name, val) {},
                                width: 174.w)
                          ],
                        ),
                      ],
                    ),
                    Container(
                      transform: Matrix4.translationValues(-13, 0, 0),
                      margin: EdgeInsets.symmetric(vertical: 23.h),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: agreed,
                              onChanged: changeAgreed,
                              splashRadius: 0),
                          SizedBox(
                            width: 314.w,
                            child: customText(
                              "I have read and accept your's Terms\nof  Use, Privacy Policy, Terms &\nConditions",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: customAuthButton("Sign Up", () => Get.to(const ConfirmPasswordScreen(fromSignup: true,))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox datePickerField(Map<String, String> e) {
    return customInputField(
      hint: pickedDate.isNotEmpty ? pickedDate : e['hint']!,
      onChange: (name, val) {},
      readonly: true,
      trailing: InkWell(
        onTap: pickDate,
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Image.asset(
            "assets/images/calendar_icon.png",
            width: 15.w,
          ),
        ),
      ),
    );
  }

  Container sizedLabelText(String text) => Container(
        margin: EdgeInsets.only(top: text == "Email" ? 0 : 23.h, bottom: 21.h),
        child: customText(text, fontSize: 15.sp, color: labelTextColor),
      );
}
