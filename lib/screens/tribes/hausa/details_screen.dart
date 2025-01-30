import 'package:cookish/constants/colors.dart';
import 'package:cookish/constants/custom_textstyles.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/appbar_components.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(
      {super.key,
      this.name,
      this.alias,
      this.ingredients,
      this.steps,
      this.image});
  final String? name, alias, image;
  final List? ingredients, steps;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.homeBg,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.0.h),
        child: AppBar(
          backgroundColor: AppColors.transparent,
          leading: AppbarComponents(
            onTap: () => Get.back(),
            icon: Icons.arrow_back,
          ),
          actions: [
            const AppbarComponents(
              icon: Icons.more_horiz,
            ),
            SizedBox(width: 16.0.w)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 311.0.h,
              decoration: BoxDecoration(
                  // color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(image ?? ''), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0.w, 18.0.h, 16.0.w, 36.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: '$name\n',
                                style: titleLarge.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins'),
                                children: [
                              TextSpan(
                                  text: '($alias)',
                                  style: titleMedium2.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: AppColors.primaryText))
                            ])),
                        const Icon(Icons.favorite_outline, size: 30)
                      ]),
                  SizedBox(height: 3.0.h),
                  Text(
                    '35 minutes • 2 servings',
                    style: bodyMedium.copyWith(color: AppColors.lightText),
                  ),
                  SizedBox(height: 8.0.h),
                  Text('Ingredients',
                      style: bodyMedium.copyWith(fontWeight: FontWeight.w700)),
                  ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return Text(' . ${ingredients?[index]}');
                      },
                      separatorBuilder: (_, __) => SizedBox(height: 3.0.h),
                      itemCount: ingredients?.length ?? 0),
                  SizedBox(height: 8.0.h),
                  Text('Preparation Steps',
                      style: bodyMedium.copyWith(fontWeight: FontWeight.w700)),
                  ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return Text(' . ${steps?[index]}');
                      },
                      separatorBuilder: (_, __) => SizedBox(height: 3.0.h),
                      itemCount: steps?.length ?? 0),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 112.0.h,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    height: 57.0.h,
                    // padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.white,
                      border: Border.all(color: AppColors.inactivePV),
                    ),
                    child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.check_circle_outline,
                                color: AppColors.lightText2),
                            SizedBox(width: 10.0.w),
                            Text('Cooked',
                                style: bodyLarge.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryText))
                          ]),
                    )),
              ),
              SizedBox(width: 12.0.w),
              //
              Container(
                  height: 57.0.h,
                  padding: EdgeInsets.symmetric(horizontal: 44.0.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.activePV,
                    border: Border.all(color: AppColors.inactivePV),
                  ),
                  child: Row(children: [
                    Text('Start Cooking',
                        style: bodyLarge.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryText))
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
