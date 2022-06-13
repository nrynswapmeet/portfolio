import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laxminarayan_portfolio/utils/utils.dart';

import 'api_calls/services/services.dart';
import 'navigators/navigators.dart';
import 'package:url_strategy/url_strategy.dart';

import 'theme/app_theme.dart';

void main() async {
  setPathUrlStrategy();
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeServices();
    Firebase.initializeApp();

    // await FacebookAuth.instance.webInitialize(
    //   appId: "1170078440473690",
    //   cookie: true,
    //   xfbml: true,
    //   version: "v13.0",
    // );
    runApp(MyApp());
  } catch (error) {
    Utility.printELog(error.toString());
  }
}

Future<void> initializeServices() async {

  Get.put(CommonService(), permanent: true);
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
    );

    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {}
          if (snapshot.connectionState == ConnectionState.done) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) => GetMaterialApp(
                scrollBehavior: AppScrollBehavior(),
                locale: const Locale('en'),
                title: 'appName'.tr,
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.light,
                getPages: AppPages.pages,
                theme: themeData(context),
                darkTheme: darkThemeData(context),
                translations: TranslationFile(),
                initialRoute: AppPages.initial,
                enableLog: true,
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
