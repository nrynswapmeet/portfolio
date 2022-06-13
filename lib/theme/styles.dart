// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_value.dart';
import 'dimens.dart';

abstract class Styles {
  static BoxDecoration cardDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: ColorsValue.whiteColor.withOpacity(0.15),
        offset: const Offset(1, 1),
        blurRadius: 16.0,
      )
    ],
    border: Border.all(width: Dimens.one, color: Colors.transparent),
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  );

  static BoxDecoration cardDecoration30 = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: ColorsValue.whiteColor.withOpacity(0.15),
        offset: const Offset(1, 1),
        blurRadius: 16.0,
      )
    ],
    border: Border.all(width: Dimens.one, color: Colors.transparent),
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
  );

  static BoxDecoration cardDecorationWithElevation = BoxDecoration(
    boxShadow: [
      BoxShadow(
          color: ColorsValue.blackColor.withOpacity(0.15),
          offset: const Offset(1, 1),
          blurRadius: 16.0)
    ],
    border: Border.all(width: Dimens.one, color: Colors.transparent),
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  );

  static BoxDecoration cardDecorationWithBorder = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: ColorsValue.whiteColor.withOpacity(0.15),
        offset: const Offset(1, 1),
        blurRadius: 16.0,
      )
    ],
    border: Border.all(
        width: 0.7, color: ColorsValue.textFieldHintColor.withOpacity(0.4)),
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  );

  static BoxDecoration cardDecorationWithOutBorder = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: ColorsValue.goldenColor.withOpacity(0.15),
        offset: const Offset(1, 1),
        blurRadius: 16.0,
      )
    ],
    // border: Border.all(
    //     width: 0.7, color: ColorsValue.textFieldHintColor.withOpacity(0.4)),
    color: ColorsValue.goldenColor.withOpacity(0.1),
    borderRadius: BorderRadius.circular(10),
  );

  static BoxDecoration backgroundDecoration = BoxDecoration(
    color: ColorsValue.backgroundColor,
    borderRadius: BorderRadius.circular(Dimens.ten),
  );

  static TextStyle onboardingTextHintColor12 = GoogleFonts.inter(
    fontWeight: FontWeight.normal,
    color: ColorsValue.textFieldHintColor,
    fontSize: Dimens.twelve,
    height: 2,
  );

  static TextStyle onboardingTextHintColor14 = GoogleFonts.inter(
    fontWeight: FontWeight.normal,
    color: ColorsValue.textFieldHintColor,
    fontSize: Dimens.fourteen,
    height: 2,
  );

  static TextStyle onboardingTextHintColor16 = GoogleFonts.inter(
    fontWeight: FontWeight.normal,
    color: ColorsValue.textFieldHintColor,
    fontSize: Dimens.sixteen,
    height: 2,
  );

  static TextStyle onboardingBold14 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
    height: 2,
  );

  static TextStyle onboardingBold16 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.blackColor,
    fontSize: Dimens.sixteen,
    height: 2,
  );

  static TextStyle normalBlack10 = GoogleFonts.inter(
    fontWeight: FontWeight.normal,
    color: ColorsValue.blackColor,
    fontSize: Dimens.ten,
  );

  static TextStyle boldBlack10 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.blackColor,
    fontSize: Dimens.ten,
  );

  static TextStyle boldBlack12 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.blackColor,
    fontSize: Dimens.twelve,
  );
  static TextStyle boldBlack14 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle boldBlack16 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.blackColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle boldBlack18 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.blackColor,
    fontSize: Dimens.eighteen,
  );

  static TextStyle boldBlack20 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.blackColor,
    fontSize: Dimens.twenty,
  );

  static TextStyle boldBlack24 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.blackColor,
    fontSize: Dimens.twentyFour,
  );

  static TextStyle boldBlack30 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.blackColor,
    fontSize: Dimens.thirty,
  );
  static TextStyle boldBlack36 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.blackColor,
    fontSize: Dimens.thirtySix,
  );

  static TextStyle boldBlack32 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.blackColor,
    fontSize: Dimens.thirty + Dimens.two,
  );

  static TextStyle boldWhite12 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: Dimens.twelve,
  );

  static TextStyle mediumWhite12 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: Dimens.twelve,
  );

  static TextStyle whiteBold12 = TextStyle(
    // color: ColorsValue.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.twelve,
  );

  static TextStyle redBold12 = TextStyle(
    // color: ColorsValue.redColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.bold,
  );

  static TextStyle boldWhite14 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: Dimens.fourteen,
  );

  static TextStyle boldWhite16 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: Dimens.sixteen,
  );

  static TextStyle boldWhite18 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: Dimens.eighteen,
  );

  static TextStyle boldButtonBg12 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.buttonBackground,
    fontSize: Dimens.twelve,
  );

  static TextStyle mediumBlack10 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.blackColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle mediumBlack12 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.blackColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle mediumBlack14 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.blackColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle boldGolden12 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.goldenColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle boldGolden14 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.goldenColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle mediumGolden14 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.goldenColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle mediumBlack16 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.blackColor,
    fontSize: Dimens.sixteen,
  );
  static TextStyle textFieldLabelStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.textFieldHintColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle textFieldLabelStyle14 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.textFieldHintColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle mediumBlack18 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.blackColor,
    fontSize: Dimens.eighteen,
  );

  static TextStyle mediumBlue16 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.blueColor,
    fontSize: Dimens.sixteen,
    // decorationStyle:
    decoration: TextDecoration.underline,
  );

  static TextStyle mediumLightGrey12 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.textFieldHintColor,
    fontSize: Dimens.twelve,
  );
  static TextStyle mediumLightGrey14 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.textFieldHintColor,
    fontSize: Dimens.fourteen,
  );
  static TextStyle boldLightGrey12 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.textFieldHintColor,
    fontSize: Dimens.twelve,
  );
  static TextStyle boldLightGrey14 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.textFieldHintColor,
    fontSize: Dimens.fourteen,
  );
  static TextStyle mediumLightGrey16 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.textFieldHintColor,
    fontSize: Dimens.sixteen,
  );

  static TextStyle boldLightGrey16 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.textFieldHintColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle accountReady24 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.accountReadyColor,
    fontSize: Dimens.twentyFour,
  );

  static TextStyle accountReady32 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.accountReadyColor,
    fontSize: Dimens.thirty + Dimens.two,
  );

  static TextStyle boldGreen12 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.greenColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle congrats20 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.congratsTextColor,
    fontSize: Dimens.twenty,
  );

  static TextStyle congrats24 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.congratsTextColor,
    fontSize: Dimens.twentyFour,
  );
  static TextStyle congrats32 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.congratsTextColor,
    fontSize: Dimens.thirty + Dimens.two,
  );
  static TextStyle accountReadyLineSpace32 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.accountReadyColor,
    fontSize: Dimens.thirty + Dimens.two,
    height: 1.5,
  );

  static TextStyle boldBlackLineSpacing16 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.blackColor,
    fontSize: Dimens.sixteen,
    height: 1.5,
  );

  static TextStyle mediumRed12 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.congratsTextColor,
    fontSize: Dimens.twelve,
  );
  static TextStyle mediumRed14 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.congratsTextColor,
    fontSize: Dimens.twelve,
  );
  static TextStyle mediumRed15 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.congratsTextColor,
    fontSize: Dimens.twelve,
  );
  static TextStyle boldRed14 = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsValue.congratsTextColor,
    fontSize: Dimens.twelve,
  );

  static TextStyle swapMeetTextAddImage12 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.swapMeetAddIconColor,
    fontSize: Dimens.twelve,
  );
  static TextStyle swapMeetTextAddImage14 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.swapMeetAddIconColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle progressBarGreen10 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.darkGreenColor,
    fontSize: Dimens.fourteen,
  );
  static TextStyle progressBarRed10 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.darkRedColor,
    fontSize: Dimens.fourteen,
  );

  static TextStyle dropDown12 = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: ColorsValue.dropDownBorderColor,
    fontSize: Dimens.twelve,
  );
}
