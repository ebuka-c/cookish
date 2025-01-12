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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Native Yoruba Cuisine',
          style: titleLarge.copyWith(color: AppColors.appPurple),
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
