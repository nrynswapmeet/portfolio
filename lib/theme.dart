import 'package:flutter/material.dart';

import 'constants.dart';

const MaterialColor kSecondaryColor = const MaterialColor(
  0xFFFA8840,
  const <int, Color>{
    50: const Color(0xFFFA8840),
    100: const Color(0xFFFA8840),
    200: const Color(0xFFFA8840),
    300: const Color(0xFFFA8840),
    400: const Color(0xFFFA8840),
    500: const Color(0xFFFA8840),
    600: const Color(0xFFFA8840),
    700: const Color(0xFFFA8840),
    800: const Color(0xFFFA8840),
    900: const Color(0xFFFA8840),
  },
);

ThemeData themeData(BuildContext context) {
  return ThemeData(
    primarySwatch: kSecondaryColor,
    primaryColor: kPrimaryColor,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    scaffoldBackgroundColor: kLightBackgroundColor,
    inputDecorationTheme: inputDecorationTheme(),
    textTheme: TextTheme(
        bodyText1: TextStyle(
          color: kLightTextColor,
        ),
        bodyText2: TextStyle(
          color: kLightTextColor1,
        ),
        headline1: TextStyle(color: Colors.black)),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    primarySwatch: kSecondaryColor,
    primaryColor: kPrimaryColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kDarkBackgroundColor,
    fontFamily: 'Poppins',
    inputDecorationTheme: inputDecorationTheme(),
    textTheme: TextTheme(
        headline1: TextStyle(
          color: kDarkTextColor,
        ),
        bodyText2: TextStyle(
          color: kDarkTextColor1,
        ),
        bodyText1: TextStyle(color: Color(0xFF919191))),
    // headline1: TextStyle(color: Color(0xFF919191))),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: Colors.transparent),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

// final otpInputDecoration = InputDecoration(
//   contentPadding: EdgeInsets.symmetric(
//     vertical: getProportionateScreenWidth(15),
//   ),
//   enabledBorder: outlineInputBorder(),
//   focusedBorder: outlineInputBorder(),
//   border: outlineInputBorder()
// );

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: kTitleColor),
  );
}
