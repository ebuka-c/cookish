import 'package:cookish/constants/colors.dart';
import 'package:cookish/constants/custom_textstyles.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:flutter/material.dart';
import '../../../constants/dummydata.dart';

class IgboDishes extends StatefulWidget {
  const IgboDishes({super.key});

  @override
  State<IgboDishes> createState() => _IgboDishesState();
}

class _IgboDishesState extends State<IgboDishes> {
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
          'Native Igbo Cuisine',
          style: titleLarge.copyWith(color: AppColors.appRed),
        ),
      ),
      body: igboScreens[navIndex],
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  navIndex = index;
                });
              },
              currentIndex: navIndex,
              backgroundColor: AppColors.white,
              selectedItemColor: AppColors.appRed,
              unselectedItemColor: AppColors.lightText2,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: 'Groceries'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outline), label: 'Favourites'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined), label: 'Settings'),
              ]),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(bottom: 70.0.h),
              decoration: BoxDecoration(
                color: AppColors.appRed,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(0.2),
                      offset: const Offset(0, 6),
                      blurRadius: 12)
                ],
              ),
              child: const Icon(
                Icons.add,
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
