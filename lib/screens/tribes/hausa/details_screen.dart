import 'package:cookish/constants/colors.dart';
import 'package:cookish/constants/custom_textstyles.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/appbar_components.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(
      {super.key, this.name, this.alias, this.ingredients, this.steps});
  final String? name, alias;
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
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
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
            children: [],
          ),
        ),
      ),
    );
  }
}
