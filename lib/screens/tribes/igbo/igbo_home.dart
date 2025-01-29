import 'dart:async';
import 'package:cookish/page_routes/route_name.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/custom_textstyles.dart';
import '../../../constants/dummydata.dart';
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
        padding: EdgeInsets.symmetric(vertical: 11.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: SearchTextField(controller: _igboFoodC),
            ),
            SizedBox(height: 19.0.h),
            //builder1
            Stack(
              alignment: Alignment.topRight,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 212.0.h),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final dishes = igboDishes[index]["dish"];
                      final image = igboDishes[index]["dishImage"];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.0.w),
                            child: Text(
                              dishes,
                              style: bodyMedium.copyWith(
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            height: 185.0.h,
                            margin: EdgeInsets.symmetric(horizontal: 16.0.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.black.withOpacity(0.1),
                                    offset: const Offset(0, 1))
                              ],
                              image: DecorationImage(
                                  image: AssetImage(image), fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.0.w),
                  child: InkWell(
                    onTap: () {
                      //see all
                      Get.toNamed(AppRoutes.igboAllDishes);
                    },
                    child: Text(
                      'See All ',
                      style: bodyLarge.copyWith(
                          color: AppColors.appRed,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.appRed),
                    ),
                  ),
                )
              ],
            ),
            SlideIndicators(
                currentIndexColor: AppColors.appRed,
                currentIndex: _currentIndex,
                length: 3),
            SizedBox(height: 22.0.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
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
                        margin:
                            index == 0 ? EdgeInsets.only(left: 16.0.h) : null,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(categsI[index]['image']),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      SizedBox(height: 10.0.h),
                      Padding(
                        padding: index == 0
                            ? EdgeInsets.only(left: 16.0.h)
                            : const EdgeInsets.all(0),
                        child: Text(
                          categsI[index]['categ'],
                          style:
                              titleSmall.copyWith(fontWeight: FontWeight.w700),
                        ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
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
                        margin:
                            index == 0 ? EdgeInsets.only(left: 16.0.h) : null,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(recommended[index]['image']),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      SizedBox(height: 10.0.h),
                      Padding(
                        padding: index == 0
                            ? EdgeInsets.only(left: 16.0.h)
                            : const EdgeInsets.all(0),
                        child: Text(
                          recommended[index]['plans'],
                          style:
                              titleSmall.copyWith(fontWeight: FontWeight.w700),
                        ),
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
