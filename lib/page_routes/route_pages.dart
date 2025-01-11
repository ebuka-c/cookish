import 'package:cookish/screens/auth/sign_up_screen.dart';
import 'package:cookish/screens/onboarding/onboarding2.dart';
import 'package:cookish/screens/onboarding/onboarding_screen.dart';
import 'package:cookish/screens/onboarding/splash2.dart';
import 'package:get/get.dart';

import '../screens/auth/login_screen.dart';
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
    // GetPage(
    // name: AppRoutes.emailConfirmOtp, page: () => const EmailConfirmOtp()),
  ];
}
