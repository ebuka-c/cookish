import 'package:cookish/constants/colors.dart';
import 'package:cookish/constants/custom_textstyles.dart';
import 'package:cookish/constants/dummydata.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_nav_bar.dart';

class HausaDishes extends StatefulWidget {
  const HausaDishes({super.key});

  @override
  State<HausaDishes> createState() => _HausaDishesState();
}

class _HausaDishesState extends State<HausaDishes> {
  int navIndex = 0;
  String title = '';

  @override
  Widget build(BuildContext context) {
    if (navIndex == 0) {
      title = 'Native Hausa Cuisine';
    } else if (navIndex == 1) {
      title = 'Groceries';
    } else if (navIndex == 2) {
      title = 'Favourites';
    } else {
      title = 'Settings';
    }
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          title,
          style: titleLarge.copyWith(
              color: AppColors.appPrimary, fontWeight: FontWeight.w600),
        ),
      ),
      body: hausaScreens[navIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: navIndex,
        onTap: (index) {
          setState(() {
            navIndex = index;
          });
        },
        colorScheme: AppColors.appPrimary,
      ),
    );
  }
}
