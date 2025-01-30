import 'package:cookish/constants/custom_textstyles.dart';
import 'package:cookish/constants/images.dart';
import 'package:cookish/page_routes/route_name.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  bool _animate = false;
  bool slideOut = false; // Control slide-out animation
  int selectedIndex = -1; // Track which container is tapped
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _animate = true;
      });
    });
  }

  void navigateToNextScreen(int index) async {
    setState(() {
      slideOut = true; // Trigger slide-out animation
      selectedIndex = index; // Identify the tapped container
    });

    // Wait for the animation to complete before navigating
    await Future.delayed(const Duration(milliseconds: 460));

    // Navigate to the corresponding screen using Get.to()
    if (index == 0) {
      Get.toNamed(AppRoutes.hausaDishes);
    } else if (index == 1) {
      Get.toNamed(AppRoutes.igboDishes);
    } else if (index == 2) {
      Get.toNamed(AppRoutes.yorubaDishes);
    }

    // Reset animation state when returning to this screen
    setState(() {
      slideOut = false;
      selectedIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100.0.h, horizontal: 15.0.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 292.0.w,
                margin: EdgeInsets.only(left: 17.0.w),
                child: Text(
                  'Experience the food culture of your preferred Nigerian tribe',
                  style: bodyLarge.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 30.0.h),
              GestureDetector(
                onTap: () => navigateToNextScreen(0),
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeOut,
                    transform: Matrix4.translationValues(
                      slideOut && selectedIndex == 0
                          ? -(screenWidth - 100) // Slide out to the left
                          : (_animate
                              ? 0
                              : screenWidth), // Animate in from the right
                      0,
                      0,
                    ),
                    child: Image.asset(AppImages.hausa,
                        width: 397.0.w, height: 120.0.h),
                  ),
                ),
              ),
              SizedBox(height: 15.0.h),
              GestureDetector(
                onTap: () => navigateToNextScreen(1),
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.easeOut,
                    transform: Matrix4.translationValues(
                      slideOut && selectedIndex == 1
                          ? -screenWidth // Slide out to the left
                          : (_animate
                              ? 0
                              : screenWidth), // Animate in from the right
                      0,
                      0,
                    ),
                    child: Image.asset(AppImages.igbo,
                        width: 397.0.w, height: 120.0.h),
                  ),
                ),
              ),
              SizedBox(height: 15.0.h),
              GestureDetector(
                onTap: () => navigateToNextScreen(2),
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeOut,
                    transform: Matrix4.translationValues(
                      slideOut && selectedIndex == 2
                          ? -screenWidth // Slide out to the left
                          : (_animate
                              ? 0
                              : screenWidth), // Animate in from the right
                      0,
                      0,
                    ),
                    child: Image.asset(AppImages.yoruba,
                        width: 397.0.w, height: 120.0.h),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
