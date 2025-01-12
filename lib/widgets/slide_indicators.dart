import 'package:cookish/constants/colors.dart';
import 'package:flutter/material.dart';

class SlideIndicators extends StatelessWidget {
  const SlideIndicators(
      {super.key,
      required this.currentIndex,
      required this.length,
      required this.currentIndexColor});
  final int currentIndex, length;
  final Color currentIndexColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    currentIndex == index ? currentIndexColor : AppColors.white,
                border: Border.all(width: 1, color: currentIndexColor)),
          ),
        ),
      ),
    );
  }
}
