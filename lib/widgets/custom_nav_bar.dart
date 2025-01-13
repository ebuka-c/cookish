import 'package:cookish/utilities/extensions.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color colorScheme;
  final Function()? onBtnTap;

  const CustomBottomNavBar(
      {super.key,
      required this.currentIndex,
      required this.onTap,
      this.onBtnTap,
      required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(height: 93.5.h),
        Container(
          height: 70.0.h, // Set your desired height
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, -2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home_outlined, 'Home', 0,
                    margin: EdgeInsets.only(left: 5.0.w),
                    colorScheme: colorScheme),
                _buildNavItem(Icons.shopping_cart_outlined, 'Groceries', 1,
                    margin: EdgeInsets.only(left: 15.0.w),
                    colorScheme: colorScheme),
                _buildNavItem(Icons.favorite_outline, 'Favourites', 2,
                    margin: EdgeInsets.only(left: 35.0.w),
                    colorScheme: colorScheme),
                _buildNavItem(Icons.settings_outlined, 'Settings', 3,
                    colorScheme: colorScheme),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 45.0.h,
          child: GestureDetector(
            onTap: onBtnTap,
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: colorScheme,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.2),
                    offset: const Offset(0, 6),
                    blurRadius: 12,
                  )
                ],
              ),
              child: const Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index,
      {margin, required Color colorScheme}) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        color: AppColors.white,
        margin: margin,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? colorScheme : AppColors.lightText2,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? colorScheme : AppColors.lightText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
