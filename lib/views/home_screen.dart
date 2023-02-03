import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/controllers/home_controller.dart';
import 'package:pharma_chain_app/widgets/custom_appbar.dart';
import 'package:pharma_chain_app/widgets/custom_drawer.dart';
import 'package:pharma_chain_app/widgets/custom_field.dart';
import 'package:pharma_chain_app/widgets/custom_text.dart';
import 'package:pharma_chain_app/widgets/scroll_glow_remover.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void deactivate() {
    Get.delete<HomeController>();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context,
          title: Text(
            "Abdullah",
            style: TextStyle(
              fontFamily: 'Mansalva',
              fontSize: 24.sp,
              color: appbarTitleColor,
            ),
          ),
          action: [
            Padding(
              padding: EdgeInsets.only(right: 35.w),
              child: Image.asset(
                "assets/images/Cart.png",
                width: 50.w,
              ),
            )
          ]),
      drawer: const CustomDrawer(),
      body: ScrollConfiguration(
        behavior: GlowRemoverBehaviour(),
        child: SingleChildScrollView(
          child: Container(
            width: 1.sw,
            margin: EdgeInsets.symmetric(horizontal: 28.w),
            padding: EdgeInsets.all(7.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customText(
                  "Place your order select\n pharmacy recive it",
                  fontWeight: FontWeight.w400,
                  fontSize: 24.sp,
                  textAlign: TextAlign.center,
                  color: mainTaglineColor,
                  lineHeight: 1.7.h,
                ),
                SizedBox(height: 15.h),
                customInputField(
                  hint: "Type here to search",
                  onChange: (name, value) {},
                  radius: 25.r,
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: homeController.cardData
                      .map((e) => homeCards(e['title'], e['image']))
                      .toList(),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: customText("Categories", fontSize: 15.sp),
                ),
                SizedBox(height: 14.h),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: homeController.categories.length ~/ 2,
                    itemBuilder: ((context, index) {
                      var val1 = homeController.categories.elementAt(index);
                      var val2 = homeController.categories.elementAt(index + 1);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20.h),
                            width: 163.w,
                            height: 115.h,
                            decoration: BoxDecoration(
                                color: Color(val1['color']),
                                borderRadius: BorderRadius.circular(8.r)),
                            alignment: Alignment.center,
                            child: customText(
                              val1['title'],
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20.h),
                            width: 163.w,
                            height: 115.h,
                            decoration: BoxDecoration(
                                color: Color(val2['color']),
                                borderRadius: BorderRadius.circular(8.r)),
                            alignment: Alignment.center,
                            child: customText(
                              val2['title'],
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          )
                        ],
                      );
                    }))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container homeCards(String title, String image) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
      width: 110.w,
      height: 94.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4.h),
            blurRadius: 10.r,
            color: shadowColor.withOpacity(.1),
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              image,
              width: 32.h,
            ),
          ),
          SizedBox(height: 2.h),
          customText(
            title,
            fontSize: 14.sp,
            color: appbarTitleColor,
            lineHeight: 1.8.h,
          )
        ],
      ),
    );
  }
}
