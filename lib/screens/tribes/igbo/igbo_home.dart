import 'dart:async';

import 'package:cookish/page_routes/route_name.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/custom_textstyles.dart';
import '../../../constants/dummydata.dart';
import '../../../constants/images.dart';
import '../../../widgets/search_textfield.dart';
import '../../../widgets/slide_indicators.dart';

final _igboFoodC = TextEditingController();

class IgboHomeScreen extends StatefulWidget {
  const IgboHomeScreen({super.key});

  @override
  State<IgboHomeScreen> createState() => _IgboHomeScreenState();
}

class _IgboHomeScreenState extends State<IgboHomeScreen> {
  int _currentIndex = 0;

  final PageController _pageController = PageController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start a timer to automatically slide every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        _currentIndex = (_currentIndex + 1) % 3; // Cycle through indexes
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 11.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(controller: _igboFoodC),
            SizedBox(height: 19.0.h),
            //builder1
            Stack(
              alignment: Alignment.topRight,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 212.0.h),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: hausaDishes.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final dishes = hausaDishes[index]["dish"];
                      final image = hausaDishes[index]["dishImage"];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dishes,
                            style: bodyMedium.copyWith(
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            height: 185.0.h,
                            margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.black,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.black.withOpacity(0.1),
                                    offset: const Offset(0, 1))
                              ],
                              image: DecorationImage(
                                  opacity: 0.7,
                                  image: AssetImage(image),
                                  fit: BoxFit.cover),
                            ),
                            child: Center(
                              child: Text(
                                dishes,
                                style: const TextStyle(
                                    fontSize: 24, color: AppColors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    //see all
                  },
                  child: Text(
                    'See All ',
                    style: bodyLarge.copyWith(
                        color: AppColors.appRed,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.appRed),
                  ),
                )
              ],
            ),
            SlideIndicators(
                currentIndexColor: AppColors.appRed,
                currentIndex: _currentIndex,
                length: hausaDishes.length),
            SizedBox(height: 22.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Categories',
                  style: titleMedium.copyWith(fontWeight: FontWeight.w600),
                ),
                InkWell(
                  onTap: () {
                    //see all
                    var color = AppColors.appRed;
                    Get.toNamed(AppRoutes.allIgboCateg, arguments: color);
                  },
                  child: Text(
                    'See All ',
                    style: bodyLarge.copyWith(
                        color: AppColors.appRed,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.appRed),
                  ),
                )
              ],
            ),
            SizedBox(height: 14.0.h),
            //builder2
            SizedBox(
              height: 211.0.h,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dishCateg.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 150.0.w,
                        height: 150.0.h,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(AppImages.miyan),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      SizedBox(height: 10.0.h),
                      Text(
                        dishCateg[index],
                        style: titleSmall.copyWith(fontWeight: FontWeight.w700),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 16.0.w,
                ),
              ),
            ),
            SizedBox(height: 16.0.h),
            //builder3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommended Plan',
                  style: titleMedium.copyWith(fontWeight: FontWeight.w600),
                ),
                InkWell(
                  child: Text(
                    'See All ',
                    style: bodyLarge.copyWith(
                        color: AppColors.appRed,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.appRed),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 211.0.h,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dietPlans.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 150.0.w,
                        height: 150.0.h,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(AppImages.miyan),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      SizedBox(height: 10.0.h),
                      Text(
                        dietPlans[index],
                        style: titleSmall.copyWith(fontWeight: FontWeight.w700),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 16.0.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
