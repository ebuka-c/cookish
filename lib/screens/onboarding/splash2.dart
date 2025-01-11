import 'dart:async';

import 'package:cookish/constants/colors.dart';
import 'package:cookish/constants/custom_textstyles.dart';
import 'package:cookish/constants/images.dart';
import 'package:cookish/page_routes/route_name.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  Timer? timer;

  startDelay() {
    timer = Timer(const Duration(seconds: 6), goNext);
  }

  goNext() {
    Get.offAllNamed(AppRoutes.onboardingScreen);
  }

  @override
  void initState() {
    super.initState();
    startDelay();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appPrimary.withOpacity(0.1),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppImages.onboardingBg,
                ),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                AppImages.logo2,
                width: 293.0.w,
                height: 71.0.h,
              ),
            ),
            const Spacer(),
            Text(
              'Preserving the Nigerian Food Heritage',
              style: bodyLarge.copyWith(
                  color: AppColors.appPrimary, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 52.0.h)
          ],
        ),
      ),
    );
  }
}
