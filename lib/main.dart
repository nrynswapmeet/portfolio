import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/theme_controller.dart';
import 'Desktop/landing_screen.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData(context),
      darkTheme: darkThemeData(context),
      // themeMode:
      //     themeController.isDark.value ? ThemeMode.dark : ThemeMode.light,
      // home: HomeScreen(),
      home: LandingScreen(),
    );
  }
}
