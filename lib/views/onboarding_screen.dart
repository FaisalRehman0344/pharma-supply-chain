import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:pharma_chain_app/constants.dart';
import 'package:pharma_chain_app/views/auth/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_chain_app/widgets/custom_appbar.dart';
import 'package:pharma_chain_app/widgets/scroll_glow_remover.dart';
import 'package:pharma_chain_app/widgets/slide_tile.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _pageController;
  List slides = [
    {
      "title": "Online pharmacy",
      "description":
          "We will provide you 100% good quality medicines that you will get with 1 click.",
      "image": "assets/images/slide_1.png"
    },
    {
      "title": "Medicines Promotions and Notifications",
      "description":
          "Receive deals and offers and any updates/ notifications on your app",
      "image": "assets/images/slide_2.png"
    },
    {
      "title": "Chat us and get answer of your question",
      "description": "Easily communicate by using the chat feature.",
      "image": "assets/images/slide_3.png"
    },
  ];

  checkFirstRun() async {
    bool firstRun = await IsFirstRun.isFirstRun();
    if (!firstRun) {
      Get.to(const LoginScreen());
    }
  }

  @override
  void initState() {
    // checkFirstRun();
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 500.24.h,
                  child: PageView(
                    scrollBehavior: GlowRemoverBehaviour(),
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    children: <Widget>[
                      SlideTile(
                        imagePath: slides[0]['image'],
                        title: slides[0]['title'],
                        desc: slides[0]['description'],
                      ),
                      SlideTile(
                        imagePath: slides[1]['image'],
                        title: slides[1]['title'],
                        desc: slides[1]['description'],
                      ),
                      SlideTile(
                        imagePath: slides[2]['image'],
                        title: slides[2]['title'],
                        desc: slides[2]['description'],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 80.h),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  for (int i = 0; i < 3; i++)
                    i == currentIndex
                        ? pageIndicator(true)
                        : pageIndicator(false),
                ]),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 42.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.off(const LoginScreen());
                    },
                    child: Container(
                      width: 70.h,
                      height: 70.h,
                      decoration: BoxDecoration(
                        color: lightGreen,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (currentIndex < 2) {
                        setState(() {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                          currentIndex++;
                        });
                      } else {
                        Get.off(const LoginScreen());
                      }
                    },
                    child: Container(
                        width: 70.h,
                        height: 70.h,
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: Image.asset(
                                "assets/images/arrow_forward.png",
                                color: Colors.white,
                                width: 33.w),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container pageIndicator(bool current) {
    return Container(
      margin: EdgeInsets.only(right: 13.w),
      width: 15.h,
      height: 15.h,
      decoration: BoxDecoration(
        color: current ? primaryGreen : lightGreen,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
