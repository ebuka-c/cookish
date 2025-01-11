import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:device_preview/device_preview.dart';

import 'bindings/app_bindings.dart';
import 'page_routes/route_name.dart';
import 'page_routes/route_pages.dart';
import 'services/theme/app_themes.dart';

Future<void> main() async {
  await GetStorage.init();
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
      // initialRoute: AppRoutes.adminBottomNav,
      initialRoute: AppRoutes.splash2,
    );
  }
}
