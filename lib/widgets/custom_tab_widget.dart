import 'package:cookish/utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/custom_textstyles.dart';

class CustomTabWidget extends StatelessWidget {
  const CustomTabWidget(this.text, this.index, {super.key});
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: AnimatedBuilder(
        animation: DefaultTabController.of(context),
        builder: (context, child) {
          bool isSelected = DefaultTabController.of(context).index == index;
          return Container(
            width: 110.0.w,
            height: 45.0.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isSelected ? AppColors.activePVBtn : AppColors.white,
              border: Border.all(
                  color:
                      isSelected ? AppColors.activePV : AppColors.inactivePV),
            ),
            child: Center(
              child: Text(text,
                  style: bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryText,
                  )),
            ),
          );
        },
      ),
    );
  }
}
