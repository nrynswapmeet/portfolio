// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Dimens {
  static double zero = 0.sp;
  static double pointOne = 0.1.sp;
  static double pointTwo = 0.2.sp;
  static double pointThree = 0.3.sp;
  static double pointFour = 0.4.sp;
  static double pointFive = 0.5.sp;
  static double pointSix = 0.6.sp;
  static double pointSeven = 0.7.sp;
  static double pointEight = 0.8.sp;
  static double pointEightFive = 0.86.sp;
  static double pointNine = 0.9.sp;
  static double one = 1.sp;
  static double two = 2.sp;
  static double three = 3.sp;
  static double four = 4.sp;
  static double five = 5.sp;
  static double six = 6.sp;
  static double seven = 7.sp;
  static double eight = 8.sp;
  static double nine = 9.sp;
  static double ten = 10.sp;
  static double eleven = 11.sp;
  static double twelve = 12.sp;
  static double thirteen = 13.sp;
  static double fourteen = 14.sp;
  static double fifteen = 15.sp;
  static double sixteen = 16.sp;
  static double seventeen = 17.sp;
  static double eighteen = 18.sp;
  static double nineteen = 19.sp;
  static double twenty = 20.sp;
  static double twentyFour = 24.sp;
  static double twentyFive = 25.sp;
  static double thirty = 30.sp;
  static double thirtyTwo = 32.sp;
  static double thirtyFive = 35.sp;
  static double thirtySix = 36.sp;
  static double thirtyEight = 38.sp;
  static double fourty = 40.sp;
  static double fourtyFive = 45.sp;
  static double fourtyEight = 48.sp;
  static double fifty = 50.sp;
  static double sixty = 60.sp;
  static double seventy = 70.sp;
  static double eighty = 80.sp;
  static double eightyFive = 85.sp;
  static double ninty = 90.sp;
  static double hundred = 100.sp;
  static double oneTwenty = 120.sp;
  static double oneFourty = 140.sp;
  static double oneFourtyTwo = 142.sp;
  static double oneSixty = 160.sp;
  static double oneEighty = 180.sp;
  static double oneEightyFive = 185.sp;
  static double twoHundred = 200.sp;
  static double twoFifty = 250.sp;
  static double threeFourty = 340.sp;

  /// Get the height with the percent value of the screen height.
  static double percentHeight(double percentValue) => percentValue.sh;

  /// Get the width with the percent value of the screen width.
  static double percentWidth(double percentValue) => percentValue.sw;

  static SizedBox getBoxWidth(double value) => SizedBox(
        width: percentWidth(value),
      );
  static SizedBox getBoxHeight(double value) => SizedBox(
        height: percentHeight(value),
      );

  static EdgeInsets edgeInsets20_20_32_20 = EdgeInsets.fromLTRB(
    Dimens.twenty,
    Dimens.twenty,
    Dimens.thirty + Dimens.two,
    Dimens.twenty,
  );
  static EdgeInsets edgeInsets0_8_0_0 = EdgeInsets.fromLTRB(
    Dimens.zero,
    Dimens.eight,
    Dimens.zero,
    Dimens.zero,
  );
  static EdgeInsets edgeInsets0_16_0_0 = EdgeInsets.fromLTRB(
    Dimens.zero,
    Dimens.sixteen,
    Dimens.zero,
    Dimens.zero,
  );
  static EdgeInsets edgeInsets0_8_20_8 = EdgeInsets.fromLTRB(
    Dimens.zero,
    Dimens.eight,
    Dimens.twenty,
    Dimens.eight,
  );

  static EdgeInsets edgeInsets8_0_8_8 = EdgeInsets.fromLTRB(
    Dimens.eight,
    Dimens.zero,
    Dimens.eight,
    Dimens.eight,
  );
  static EdgeInsets edgeInsets24_16_24_16 = EdgeInsets.fromLTRB(
    Dimens.twentyFour,
    Dimens.sixteen,
    Dimens.twentyFour,
    Dimens.sixteen,
  );
  static EdgeInsets edgeInsets8_0_8_12 = EdgeInsets.fromLTRB(
    Dimens.eight,
    Dimens.zero,
    Dimens.eight,
    Dimens.twelve,
  );
  static EdgeInsets edgeInsets8_4 =
      const EdgeInsets.symmetric(horizontal: 8, vertical: 4);

  static EdgeInsets edgeInsets12_0_12_0 = EdgeInsets.fromLTRB(
    Dimens.twelve,
    Dimens.zero,
    Dimens.twelve,
    Dimens.zero,
  );

  static EdgeInsets edgeInsets12_8_12_8 = EdgeInsets.fromLTRB(
    Dimens.twelve,
    Dimens.eight,
    Dimens.twelve,
    Dimens.eight,
  );

  static EdgeInsets edgeInsets16_8_16_8 = EdgeInsets.fromLTRB(
    Dimens.sixteen,
    Dimens.eight,
    Dimens.sixteen,
    Dimens.eight,
  );

  static EdgeInsets edgeInsets8_16_8_16 = EdgeInsets.fromLTRB(
    Dimens.eight,
    Dimens.sixteen,
    Dimens.eight,
    Dimens.sixteen,
  );

  static EdgeInsets edgeInsets20_12_20_12 = EdgeInsets.fromLTRB(
    Dimens.twenty,
    Dimens.twelve,
    Dimens.twenty,
    Dimens.twelve,
  );

  static EdgeInsets edgeInsets0_20_20_20 = EdgeInsets.fromLTRB(
    Dimens.zero,
    Dimens.twenty,
    Dimens.twenty,
    Dimens.twenty,
  );

  static EdgeInsets edgeInsets0_16_16_16 = EdgeInsets.fromLTRB(
    Dimens.zero,
    Dimens.sixteen,
    Dimens.sixteen,
    Dimens.sixteen,
  );

  static EdgeInsets edgeInsets0_50_0_50 = EdgeInsets.fromLTRB(
    Dimens.zero,
    Dimens.fifty,
    Dimens.zero,
    Dimens.fifty,
  );

  static EdgeInsets edgeInsets0_100_0_100 = EdgeInsets.fromLTRB(
    Dimens.zero,
    Dimens.hundred,
    Dimens.zero,
    Dimens.hundred,
  );

  static EdgeInsets edgeInsets0_8_0_8 = EdgeInsets.fromLTRB(
    Dimens.zero,
    Dimens.eight,
    Dimens.zero,
    Dimens.eight,
  );

  //   static EdgeInsets edgeInsets0_100_0_100 = EdgeInsets.fromLTRB(
  //   Dimens.zero,
  //   Dimens.hundred,
  //   Dimens.zero,
  //   Dimens.hundred,
  // );

  static SizedBox box0 = const SizedBox.shrink();

  static SizedBox boxHeight3 = SizedBox(height: Dimens.three);
  static SizedBox boxHeight5 = SizedBox(height: Dimens.five);
  static SizedBox boxHeight8 = SizedBox(height: Dimens.eight);
  static SizedBox boxHeight10 = SizedBox(height: Dimens.ten);
  static SizedBox boxHeight12 = SizedBox(height: Dimens.twelve);

  static SizedBox boxHeight15 = SizedBox(height: Dimens.fifteen);
  static SizedBox boxHeight20 = SizedBox(height: Dimens.twenty);
  static SizedBox boxHeight25 = SizedBox(height: Dimens.twentyFive);
  static SizedBox boxHeight30 = SizedBox(height: Dimens.thirty);
  static SizedBox boxHeight35 = SizedBox(height: Dimens.thirtyFive);
  static SizedBox boxHeight40 = SizedBox(height: Dimens.fourty);
  static SizedBox boxHeight60 = SizedBox(height: Dimens.sixty);

  static SizedBox boxWidth3 = SizedBox(width: Dimens.three);
  static SizedBox boxWidth5 = SizedBox(width: Dimens.five);
  static SizedBox boxWidth10 = SizedBox(width: Dimens.ten);
  static SizedBox boxWidth15 = SizedBox(width: Dimens.fifteen);
  static SizedBox boxWidth20 = SizedBox(width: Dimens.twenty);
  static SizedBox boxWidth30 = SizedBox(width: Dimens.thirty);
  static SizedBox boxWidth40 = SizedBox(width: Dimens.fourty);
  static SizedBox boxWidth50 = SizedBox(width: Dimens.fifty);
  static SizedBox boxWidth80 = SizedBox(width: Dimens.eighty);
  static SizedBox boxWidth100 = SizedBox(width: Dimens.hundred);

  static EdgeInsets edgeInsets0 = EdgeInsets.all(Dimens.zero);
  static EdgeInsets edgeInsets4 = EdgeInsets.all(Dimens.four);
  static EdgeInsets edgeInsets6 = EdgeInsets.all(Dimens.six);
  static EdgeInsets edgeInsets8 = EdgeInsets.all(Dimens.eight);
  static EdgeInsets edgeInsets10 = EdgeInsets.all(Dimens.ten);
  static EdgeInsets edgeInsets12 = EdgeInsets.all(Dimens.twelve);
  static EdgeInsets edgeInsets14 = EdgeInsets.all(Dimens.fourteen);
  static EdgeInsets edgeInsets16 = EdgeInsets.all(Dimens.sixteen);
  static EdgeInsets edgeInsets20 = EdgeInsets.all(Dimens.twenty);
  static EdgeInsets edgeInsets30 = EdgeInsets.all(Dimens.thirty);
  static EdgeInsets edgeInsets32 = EdgeInsets.all(Dimens.thirtyTwo);
}
