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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Native Hausa Cuisine',
          style: titleLarge.copyWith(color: AppColors.appPrimary),
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
