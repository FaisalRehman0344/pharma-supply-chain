import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/views/auth/login_screen.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';
import 'package:pharma_chain_app/widgets/scroll_glow_remover.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List tabs = [
      {
        "image": "assets/images/account.png",
        "title": "Account Settings",
        "screen": const LoginScreen()
      },
      {
        "image": "assets/images/orders.png",
        "title": "My orders",
        "screen": const LoginScreen()
      },
      {
        "image": "assets/images/payment.png",
        "title": "Payment method change",
        "screen": const LoginScreen()
      },
      {
        "image": "assets/images/location.png",
        "title": "Address",
        "screen": const LoginScreen()
      },
      {
        "image": "assets/images/payment.png",
        "title": "Privacy",
        "screen": const LoginScreen()
      },
      {
        "image": "assets/images/faq.png",
        "title": "Faq",
        "screen": const LoginScreen()
      },
      {
        "image": "assets/images/help.png",
        "title": "Help",
        "screen": const LoginScreen()
      },
      {
        "image": "assets/images/logout.png",
        "title": "Log Out",
        "screen": const LoginScreen()
      }
    ];

    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.r), bottomRight: Radius.circular(30.r)),
      child: Drawer(
        width: 327.sp,
        child: ScrollConfiguration(
          behavior: GlowRemoverBehaviour(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 191.h,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 19.h),
                        child: Image.asset("assets/images/nav_background.png",
                            fit: BoxFit.fill),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 19.h),
                        color: Colors.black.withOpacity(.5),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 30.h),
                          child: customText("Abdullah",
                              fontSize: 20.sp, color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 122.h, left: 22.w),
                          width: 69.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/Ellipse 2.png"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.5.h),
                Column(
                  children: tabs
                      .map((e) => InkWell(
                            splashColor: primaryGreen.withOpacity(.3),
                            onTap: e['title'] == "Log Out"
                                ? (() => Get.to(e['screen']))
                                : () {},
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                  left: 30.w,
                                  top: 22.5.h,
                                  bottom: 22.5.h,
                                  right: 30.w),
                              child: Row(
                                children: [
                                  Image.asset(e['image'], width: 16.w),
                                  SizedBox(width: 20.w),
                                  customText(e['title'],
                                      fontSize: 15.sp, color: primaryGreen)
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
