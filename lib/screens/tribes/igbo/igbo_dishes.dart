import 'package:cookish/constants/colors.dart';
import 'package:cookish/constants/custom_textstyles.dart';
import 'package:flutter/material.dart';
import '../../../constants/dummydata.dart';
import '../../../widgets/custom_nav_bar.dart';

class IgboDishes extends StatefulWidget {
  const IgboDishes({super.key});

  @override
  State<IgboDishes> createState() => _IgboDishesState();
}

class _IgboDishesState extends State<IgboDishes> {
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
              color: AppColors.appRed, fontWeight: FontWeight.w600),
        ),
      ),
      body: igboScreens[navIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: navIndex,
        onTap: (index) {
          setState(() {
            navIndex = index;
          });
        },
        colorScheme: AppColors.appRed,
      ),
    );
  }
}
