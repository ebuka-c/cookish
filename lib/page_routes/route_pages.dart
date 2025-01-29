import 'package:cookish/screens/auth/sign_up_screen.dart';
import 'package:cookish/screens/categ/breakfast_categ.dart';
import 'package:cookish/screens/categ/dessert_categ.dart';
import 'package:cookish/screens/categ/soup_categ.dart';
import 'package:cookish/screens/categ/stew_categ.dart';
import 'package:cookish/screens/categ/swallow_categ.dart';
import 'package:cookish/screens/nav_screens.dart/settings.dart';
import 'package:cookish/screens/tribes/hausa/all_categories/all_categ.dart';
import 'package:cookish/screens/tribes/hausa/feedback_screen.dart';
import 'package:cookish/screens/tribes/hausa/hausa_dishes.dart';
import 'package:cookish/screens/tribes/igbo/all_categories/all_categ.dart';
import 'package:cookish/screens/tribes/igbo/all_dishes/igbo_all.dart';
import 'package:cookish/screens/tribes/igbo/igbo_dishes.dart';
import 'package:cookish/screens/tribes/yoruba/all_categories/all_categ.dart';
import 'package:cookish/screens/tribes/yoruba/all_dishes/yoruba_all.dart';
import 'package:cookish/screens/tribes/yoruba/yoruba_dishes.dart';
import 'package:cookish/screens/onboarding/onboarding2.dart';
import 'package:cookish/screens/onboarding/onboarding_screen.dart';
import 'package:cookish/screens/onboarding/splash2.dart';
import 'package:get/get.dart';

import '../screens/auth/login_screen.dart';
import '../screens/tribes/hausa/all_dishes/hausa_all.dart';
import 'route_name.dart';

class RoutePages {
  static final List<GetPage> routes = [
    // GetPage(
    //     name: AppRoutes.splashScreen,
    //     page: () => const SplashScreen(),
    //     transition: Transition.fadeIn,
    //     transitionDuration: const Duration(seconds: 1)),
    GetPage(
        name: AppRoutes.splash2,
        page: () => const Splash2(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(seconds: 1)),
    GetPage(
      name: AppRoutes.onboardingScreen,
      page: () => const OnboardingScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.onboarding2,
      page: () => const Onboarding2(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.signInScreen,
      page: () => const LoginScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => const SignUpScreen(),
      transition: Transition.fadeIn,
    ),

    //CATEGORIES
    GetPage(
      name: AppRoutes.igboDishes,
      page: () => const IgboDishes(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.hausaDishes,
      page: () => const HausaDishes(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.yorubaDishes,
      page: () => const YorubaDishes(),
      transition: Transition.fadeIn,
    ),

    //hausa
    GetPage(
      name: AppRoutes.allHausaCateg,
      page: () => const AllHausaCateg(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.soupCategH,
      page: () => SoupCateg(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.stewCategH,
      page: () => const StewCateg(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.swallowCategH,
      page: () => const SwallowCateg(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.breakfastCategH,
      page: () => const BreakfastCateg(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.dessertCategH,
      page: () => const DessertCateg(),
      transition: Transition.fadeIn,
    ),
    //igbo

    GetPage(
      name: AppRoutes.allIgboCateg,
      page: () => const AllIgboCateg(),
      transition: Transition.fadeIn,
    ),

    //yoruba
    GetPage(
      name: AppRoutes.allYorubaCateg,
      page: () => const AllYorubaCateg(),
      transition: Transition.fadeIn,
    ),

    //settings
    GetPage(
      name: AppRoutes.settings,
      page: () => const Settings(),
      transition: Transition.fadeIn,
    ),

    //all
    GetPage(
      name: AppRoutes.hausaAll,
      page: () => const AllHausaDishes(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.igboAllDishes,
      page: () => const AllIgboDishes(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.yorubaAllDishes,
      page: () => const AllYorubaDishes(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.feedbackScreen,
      page: () => const FeedbackScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
