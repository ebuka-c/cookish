import 'package:cookish/constants/custom_textstyles.dart';
import 'package:cookish/constants/images.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:flutter/material.dart';

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
              Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOut,
                  transform: Matrix4.translationValues(
                    _animate ? 0 : screenWidth,
                    0,
                    0,
                  ),
                  child: Image.asset(AppImages.hausa,
                      width: 397.0.w, height: 120.0.h),
                ),
              ),
              SizedBox(height: 15.0.h),
              Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeOut,
                  transform: Matrix4.translationValues(
                    _animate ? 0 : screenWidth, // Move from right to center
                    0,
                    0,
                  ),
                  child: Image.asset(AppImages.igbo,
                      width: 397.0.w, height: 120.0.h),
                ),
              ),
              SizedBox(height: 15.0.h),
              Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeOut,
                  transform: Matrix4.translationValues(
                    _animate ? 0 : screenWidth, // Move from right to center
                    0,
                    0,
                  ),
                  child: Image.asset(AppImages.yoruba,
                      width: 397.0.w, height: 120.0.h),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
