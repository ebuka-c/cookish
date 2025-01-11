import 'package:cookish/constants/colors.dart';
import 'package:cookish/constants/custom_textstyles.dart';
import 'package:cookish/constants/images.dart';
import 'package:cookish/constants/texts_and_strings.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../page_routes/route_name.dart';
import '../../widgets/app_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 25.0.h),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Text(
                'Welcome to',
                style: bodyLarge.copyWith(
                    fontWeight: FontWeight.w700, color: AppColors.black),
              ),
              SizedBox(height: 24.0.h),
              Image.asset(AppImages.logo2, width: 208.0.w, height: 41.0.h),
              SizedBox(height: 24.0.h),
              SizedBox(
                width: 292.0.w,
                height: 96.0.h,
                child: Text(
                  aboutCookish,
                  textAlign: TextAlign.center,
                  style: bodyLarge.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const Spacer(),
              AppButton(
                onTap: () {
                  Get.toNamed(AppRoutes.signUpScreen);
                },
                text: 'Get Started',
              ),
              SizedBox(height: 16.0.h),
              RichText(
                text: TextSpan(
                  text: 'Already a member? ',
                  style: bodyLarge.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.lightText),
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: bodyLarge.copyWith(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: AppColors.primaryText),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(AppRoutes.signInScreen);
                        },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
