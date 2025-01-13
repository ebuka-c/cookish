import 'package:cookish/constants/colors.dart';
import 'package:cookish/constants/custom_textstyles.dart';
import 'package:flutter/material.dart';
import '../../../constants/dummydata.dart';
import '../../../widgets/custom_nav_bar.dart';

class YorubaDishes extends StatefulWidget {
  const YorubaDishes({super.key});

  @override
  State<YorubaDishes> createState() => _YorubaDishesState();
}

class _YorubaDishesState extends State<YorubaDishes> {
  int navIndex = 0;
  String title = '';

  @override
  Widget build(BuildContext context) {
    if (navIndex == 0) {
      title = 'Native Yoruba Cuisine';
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
              color: AppColors.appPurple, fontWeight: FontWeight.w600),
        ),
      ),
      body: yorubaScreens[navIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: navIndex,
        onTap: (index) {
          setState(() {
            navIndex = index;
          });
        },
        onBtnTap: () {},
        colorScheme: AppColors.appPurple,
      ),
    );
  }
}
