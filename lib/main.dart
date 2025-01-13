import 'package:cookish/screens/onboarding/onboarding2.dart';
import 'package:cookish/screens/onboarding/splash2.dart';
import 'package:cookish/widgets/button_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:device_preview/device_preview.dart';
import 'bindings/app_bindings.dart';
import 'page_routes/route_pages.dart';
import 'services/theme/app_themes.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  await GetStorage.init();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBGBQ4R25B7YNcct6mcXFaoTAxYLhf7C1w",
          appId: "1:861897110792:android:032341c056f428cc0728bd",
          messagingSenderId: "861897110792",
          projectId: "cook-app-9beda"));
  AppBindings().dependencies();
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cookish Mobile',
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppThemes().lightTheme,
      getPages: RoutePages.routes,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: AppLoadingIndicator());
          }
          if (snapshot.data != null) {
            return const Onboarding2();
          }
          return const Splash2();
        },
      ),
    );
  }
}
