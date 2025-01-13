import 'package:cookish/constants/colors.dart';
import 'package:cookish/screens/tribes/hausa/hausa_home.dart';
import 'package:cookish/screens/tribes/igbo/igbo_home.dart';
import 'package:cookish/screens/tribes/yoruba/yoruba_home_screen.dart';
import 'package:cookish/screens/nav_screens.dart/favourites.dart';
import 'package:cookish/screens/nav_screens.dart/groceries.dart';
import 'package:cookish/screens/nav_screens.dart/settings.dart';
import 'package:flutter/material.dart';

import 'images.dart';

final List<Map<String, dynamic>> hausaDishes = [
  {"dish": "Tuwon Shinkafa", "dishImage": AppImages.tuwo},
  {"dish": "Miyan Taushe", "dishImage": AppImages.miyan},
  {"dish": "Koko", "dishImage": AppImages.koko},
  {"dish": "Kilishi", "dishImage": AppImages.kilishi},
];

final List<Map<String, dynamic>> igboDishes = [
  {"dish": "Akpu and Onugbu", "dishImage": AppImages.onugbu},
  {"dish": "Abacha", "dishImage": AppImages.abacha},
  {"dish": "Ukwa", "dishImage": AppImages.ukwa},
  {"dish": "Tomato Stew", "dishImage": AppImages.igboStew},
];

final List<Map<String, dynamic>> yorubaDishes = [
  {"dish": "Amala & Ewedu", "dishImage": AppImages.amala},
  {"dish": "Pepper Stew", "dishImage": AppImages.yorubaStew},
  {"dish": "Efo Riro", "dishImage": AppImages.eforiro},
  {"dish": "Eba", "dishImage": AppImages.tuwo},
];

final List<Map<String, dynamic>> categsH = [
  {"categ": "Soups", "image": AppImages.hausaSoup},
  {"categ": "Stews", "image": AppImages.hausaStew},
  {"categ": "Swallow", "image": AppImages.hausaSwallow},
  {"categ": "Breakfast", "image": AppImages.weightLoss},
  {"categ": "Dessert", "image": AppImages.hausaDessert},
];

final List<Map<String, dynamic>> categsI = [
  {"categ": "Soups", "image": AppImages.igboSoup},
  {"categ": "Stews", "image": AppImages.igboStew},
  {"categ": "Swallow", "image": AppImages.onugbu},
  {"categ": "Breakfast", "image": AppImages.hausaDessert},
  {"categ": "Dessert", "image": AppImages.miyan},
];
final List<Map<String, dynamic>> categsY = [
  {"categ": "Soups", "image": AppImages.eforiro},
  {"categ": "Stews", "image": AppImages.yorubaStew},
  {"categ": "Swallow", "image": AppImages.amala},
  {"categ": "Breakfast", "image": AppImages.hausaDessert},
  {"categ": "Dessert", "image": AppImages.miyan},
];

final List<Map<String, dynamic>> recommended = [
  {"plans": "Weight Loss", "image": AppImages.weightLoss},
  {"plans": "Keto", "image": AppImages.keto},
  {"plans": "Plant Based", "image": AppImages.plantBased},
  {"plans": "Low Carb", "image": AppImages.lowCarb},
];

final List<String> dishCateg = ["Soups", "Stews", "Swallow", "Dessert"];

final List<String> dietPlans = [
  "Weight Loss",
  "Keto",
  "Plant Based",
  "Low Carb",
];

List<Widget> hausaScreens = const [
  HausaHomeScreen(),
  Groceries(),
  Favourites(),
  Settings(
    color: AppColors.appPrimary,
  ),
];

List<Widget> igboScreens = const [
  IgboHomeScreen(),
  Groceries(),
  Favourites(),
  Settings(
    color: AppColors.appRed,
  )
];

List<Widget> yorubaScreens = const [
  YorubaHomeScreen(),
  Groceries(),
  Favourites(),
  Settings(
    color: AppColors.appPurple,
  )
];
