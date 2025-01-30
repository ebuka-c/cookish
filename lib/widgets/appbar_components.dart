import 'package:cookish/utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppbarComponents extends StatelessWidget {
  const AppbarComponents({super.key, required this.icon, this.onTap});
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44.0.w,
        height: 44.0.h,
        margin: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 3,
            ),
          ],
        ),
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}
