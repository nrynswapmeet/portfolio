import 'package:flutter/material.dart';

import 'colors_value.dart';

ThemeData themeData(BuildContext context) => ThemeData(
      // primarySwatch: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: ColorsValue.blackColor,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
      primaryColor: const Color(0xffff696d),
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorsValue.whiteColor,
      colorScheme: ColorScheme.light(
        surface: Colors.black.withOpacity(.16),
        onInverseSurface: const Color.fromRGBO(0, 0, 0, 0.12),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      inputDecorationTheme:
          const InputDecorationTheme(fillColor: ColorsValue.greyColor),
      tabBarTheme: const TabBarTheme(
        labelColor: ColorsValue.blackColor,
      ),
    );

ThemeData darkThemeData(BuildContext context) => ThemeData(
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: ColorsValue.whiteColor,
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      primaryColor: const Color(0xffff696d),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
      ),
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        surface: Colors.white.withOpacity(.16),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: ColorsValue.greyColor,
      ),
      scaffoldBackgroundColor: Colors.black,
      tabBarTheme: const TabBarTheme(
        labelColor: ColorsValue.whiteColor,
      ),
    );
