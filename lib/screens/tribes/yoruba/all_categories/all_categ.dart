import 'package:cookish/screens/app_data/Yoruba_data.dart';
import 'package:cookish/utilities/extensions.dart';
import 'package:cookish/widgets/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/custom_textstyles.dart';
import 'by_meal_type/breakfast.dart';
import 'by_meal_type/dessert.dart';
import 'by_meal_type/drinks.dart';
import 'by_meal_type/soups.dart';
import 'by_meal_type/stews.dart';
import 'by_meal_type/swallow.dart';

class AllYorubaCateg extends StatefulWidget {
  const AllYorubaCateg({super.key});

  @override
  State<AllYorubaCateg> createState() => _AllYorubaCategState();
}

class _AllYorubaCategState extends State<AllYorubaCateg>
    with SingleTickerProviderStateMixin {
  final widgetsColor = Get.arguments;

  final List categList = [
    {'name': 'Soup', 'isAvailable': true},
    {'name': 'Stew', 'isAvailable': true},
    {'name': 'Swallow', 'isAvailable': true},
    {'name': 'Breakfast', 'isAvailable': true},
    {'name': 'Dessert', 'isAvailable': true},
  ];

  late AnimationController _controller;
  late List<Animation<Offset>> animations;
  late Animation<double> fadeAnimation;
  int? selectedIndex; // Tracks the clicked item

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Create staggered animations for each list item
    animations = List.generate(
      categList.length,
      (index) => Tween<Offset>(
        begin: const Offset(0, 1), // Start off-screen
        end: const Offset(0, 0), // End at its final position
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.2, // Stagger animation start
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      ),
    );

    // Start the animation
    _controller.forward();
    fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void goToNext(int index) {
    if (index == 0) {
      Get.to(YorubaSoupCateg(priColor: widgetsColor, title: 'Soup'));
    }
    if (index == 1) {
      //StewCateg
      Get.to(YorubaStewCateg(priColor: widgetsColor, title: 'Stew'));
    }
    if (index == 2) {
      //
      Get.to(YorubaSwallowCateg(priColor: widgetsColor, title: 'Swallow'));
    }
    if (index == 3) {
      Get.to(YorubaBreakfastCateg(priColor: widgetsColor, title: 'Breakfast'));
    }
    if (index == 4) {
      //
      Get.to(YorubaDessertCateg(priColor: widgetsColor, title: 'Dessert'));
    }
    if (index == 5) {
      //
      Get.to(YorubaDrinksCateg(priColor: widgetsColor, title: 'Drinks'));
    }

    // Navigate to the next screen
  }

  final allRecipesLength = [
    yorubaSoupList.length,
    yorubaStewList.length,
    yorubaSwallowList.length,
    yorubaBreakfastList.length,
    yorubaDessertList.length
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: widgetsColor,
        title: Text(
          'Category',
          style: titleLarge.copyWith(
              color: AppColors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          GestureDetector(
              onTap: () => Get.to(
                    SearchScreen(),
                    transition: Transition.noTransition,
                  ),
              child:
                  const Icon(Icons.search, color: AppColors.white, size: 30)),
          SizedBox(
            width: 15.0.w,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 135.0.h, horizontal: 15.0.w),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return SlideTransition(
                position: animations[index],
                child: InkWell(
                  onTap: categList[index]['isAvailable']
                      ? () {
                          goToNext(index);
                        }
                      : null,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 47.0.w, right: 13.0.w),
                    height: 57.0.h,
                    decoration: BoxDecoration(
                      color: widgetsColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: categList[index]['isAvailable']
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.center,
                        children: [
                          Text(categList[index]['name'],
                              style:
                                  titleSmall.copyWith(color: AppColors.white)),
                          Text(
                            '${allRecipesLength[index]} Recipes',
                            style: titleSmall.copyWith(color: AppColors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (c, i) => SizedBox(height: 12.0.h),
            itemCount: categList.length),
      ),
    );
  }
}
