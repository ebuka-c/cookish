import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookish/page_routes/route_name.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:cookish/widgets/button_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/custom_textstyles.dart';
import '../../../constants/dummydata.dart';
import '../../../widgets/search_textfield.dart';
import '../../../widgets/slide_indicators.dart';

final _hausaFoodC = TextEditingController();

class HausaHomeScreen extends StatefulWidget {
  const HausaHomeScreen({super.key});

  @override
  State<HausaHomeScreen> createState() => _HausaHomeState();
}

class _HausaHomeState extends State<HausaHomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late Timer _timer;

  List<Map<String, dynamic>> _hausaDishes = [];
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        _currentIndex = (_currentIndex + 1) % 3;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
    _fetchData();
  }

  Future<void> _fetchData() async {
    isLoading = true;
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('hausa')
          .doc("0fxU4ipiSi6tQrpgFV7x")
          .get();
      // final data = querySnapshot.docs.map((doc) => doc.data()).toList();
      if (kDebugMode) print('DATA:::::::: ${docSnapshot.data()}'); //test

      var data = (docSnapshot.data()?["all_dishes"]).toList();
      setState(() {
        _hausaDishes = data.cast<Map<String, dynamic>>();
      });
      if (kDebugMode) print('DATA FETCHED:::::::: $data'); //test
    } on FirebaseException catch (e) {
      if (kDebugMode) print('Error fetching data: ${e.message}');
    } finally {
      isLoading = false;
    }
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
              child: SearchTextField(controller: _hausaFoodC),
            ),
            SizedBox(height: 19.0.h),

            Stack(
              alignment: Alignment.topRight,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 212.0.h),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount:
                        _hausaDishes.length < 3 ? _hausaDishes.length : 3,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final dishes = _hausaDishes[index]["name"];
                      // final image = _hausaDishes[index]['image'];

                      if (isLoading ||
                          _hausaDishes.isEmpty ||
                          _hausaDishes.length < 3) {
                        return const Center(
                          child: AppLoadingIndicator(
                            size: 20,
                          ),
                        );
                      }

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
                              color: AppColors.black,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.black.withOpacity(0.1),
                                    offset: const Offset(0, 1))
                              ],
                              image: DecorationImage(
                                  opacity: 0.7,
                                  image: AssetImage(
                                      hausaDishes[index]['dishImage']),
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
                Padding(
                  padding: EdgeInsets.only(right: 16.0.w),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.hausaAll, arguments: _hausaDishes);
                    },
                    child: Text(
                      'See All ',
                      style: bodyLarge.copyWith(
                          color: AppColors.appPrimary,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.appPrimary),
                    ),
                  ),
                ),
              ],
            ),
            SlideIndicators(
                currentIndexColor: AppColors.appPrimary,
                currentIndex: _currentIndex,
                length: 3),
            SizedBox(height: 22.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0.w),
                  child: Text(
                    'Categories',
                    style: titleMedium.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.0.w),
                  child: InkWell(
                    onTap: () {
                      var color = AppColors.appPrimary;
                      Get.toNamed(AppRoutes.allHausaCateg, arguments: color);
                    },
                    child: Text(
                      'See All ',
                      style: bodyLarge.copyWith(
                          color: AppColors.appPrimary,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.appPrimary),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.0.h),
            //builder2
            SizedBox(
              height: 211.0.h,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categsH.length,
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
                            border: Border.all(color: AppColors.lightText2),
                            image: DecorationImage(
                                image: AssetImage(categsH[index]['image']),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      SizedBox(height: 10.0.h),
                      Padding(
                        padding: index == 0
                            ? EdgeInsets.only(left: 16.0.h)
                            : const EdgeInsets.only(left: 0),
                        child: Text(
                          categsH[index]['categ'],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0.w),
                  child: Text(
                    'Recommended Plan',
                    style: titleMedium.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.0.w),
                  child: Text(
                    'See All ',
                    style: bodyLarge.copyWith(
                        color: AppColors.appPrimary,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.appPrimary),
                  ),
                ),
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
