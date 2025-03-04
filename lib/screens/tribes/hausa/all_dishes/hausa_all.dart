import 'package:cookish/utilities/extensions.dart';
import 'package:cookish/widgets/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/custom_textstyles.dart';
import '../../../../constants/dummydata.dart';

class AllHausaDishes extends StatefulWidget {
  const AllHausaDishes({super.key});

  @override
  State<AllHausaDishes> createState() => _AllHausaDishesState();
}

class _AllHausaDishesState extends State<AllHausaDishes>
    with SingleTickerProviderStateMixin {
  final dishes = Get.arguments;

  // final List categList = [
  //   {'name': 'Soup', 'isAvailable': true},
  //   {'name': 'Stew', 'isAvailable': true},
  //   {'name': 'Swallow', 'isAvailable': false},
  //   {'name': 'Breakfast', 'isAvailable': false},
  //   {'name': 'Dessert', 'isAvailable': true},
  // ];

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
      dishes.length,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: AppColors.appPrimary,
        title: Text(
          'All Hausa Dishes',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100.0.h),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SlideTransition(
                    position: animations[index],
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10.0.w, right: 13.0.w),
                      margin: EdgeInsets.symmetric(horizontal: 15.0.w),
                      height: 110.0.h,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.black.withOpacity(0.2),
                                offset: const Offset(1, 4),
                                blurRadius: 10)
                          ]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 100.0.h,
                            height: 70.0.h,
                            decoration: BoxDecoration(
                                color: AppColors.lightText2,
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    opacity: 0.7,
                                    image: AssetImage(
                                        hausaDishes[index]['dishImage']),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(width: 50.0.w),
                          Text("${dishes[index]['name']}")
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (c, i) => SizedBox(height: 12.0.h),
                itemCount: dishes.length),
            SizedBox(height: 200.0.h),
          ],
        ),
      ),
    );
  }
}
