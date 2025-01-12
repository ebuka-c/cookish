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
  Settings()
];

List<Widget> igboScreens = const [
  IgboHomeScreen(),
  Groceries(),
  Favourites(),
  Settings()
];

List<Widget> yorubaScreens = const [
  YorubaHomeScreen(),
  Groceries(),
  Favourites(),
  Settings()
];
