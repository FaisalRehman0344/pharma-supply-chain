import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:pharma_chain_app/views/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  checkFirstRun() async {
    bool firstRun = await IsFirstRun.isFirstRun();
    firstRun ? Get.to(const OnboardingScreen()) : Get.to(const LoginScreen());
  }

  @override
  void initState() {
    // checkFirstRun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Onboarding"),
      ),
    );
  }
}
