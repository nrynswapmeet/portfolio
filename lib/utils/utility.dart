import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../theme/colors_value.dart';
import '../theme/dimens.dart';



abstract class Utility {
  static void printDLog(String message) {
    Logger().d('${'appname'.tr}: $message');
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printILog(dynamic message) {
    Logger().i('${'appname'.tr}: $message');
  }

  /// Show info dialog
  static void showDialog(
    String message, {
    Function()? onPress,
  }) async {
    await Get.dialog<void>(
      CupertinoAlertDialog(
        title: const Text('Info'),
        content: Text(
          message,
        ),
        actions: [
          CupertinoButton(
            onPressed: onPress ?? Get.back,
            child: Text(
              'Okay',
              style: TextStyle(color: Theme.of(Get.context!).primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printLog(dynamic message) {
    Logger().log(Level.info, message);
  }

  /// Print error log.
  ///
  /// [message] : The message which needed to be print.
  static void printELog(String message) {
    Logger().e('${'appname'.tr}: $message');
  }

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  // /// Show no internet dialog if there is no
  // /// internet available.
  // static Future<void> showNoInternetDialog() async {
  //   await Get.dialog<void>(
  //     const NoInternetWidget(),
  //     barrierDismissible: false,
  //   );
  // }

  /// Show loader
  static void showLoader() async {
    await Get.dialog<void>(
      const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(.3),
    );
  }

  /// Returns true if the internet connection is available.
  static Future<bool> isNetworkAvailable() async => true;
  // await InternetConnectionChecker().hasConnection;

  static void sendFlutterSuccessToast(String? message) {
    Fluttertoast.showToast(
      msg: message ?? 'Toast Success',
      toastLength: Toast.LENGTH_LONG,
      gravity: GetPlatform.isMobile ? ToastGravity.BOTTOM : ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorsValue.greenColor,
      textColor: Colors.white,
      fontSize: Dimens.sixteen,
      webBgColor: 'linear-gradient(to right, #20c57d, #20c57d)',
    );
  }

  static Dialog alertDialog(
      {BuildContext? context,
      String? title,
      String? body,
      String? image,
      Color? color,
      Function()? onTap,
      Function()? onTapCancle}) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        padding: Dimens.edgeInsets16,
        width: MediaQuery.of(context!).size.width * .4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 30,
                  width: 15,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        4,
                      ),
                    ),
                  ),
                ),
                Dimens.boxWidth10,
                Text(
                  title!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Dimens.fourteen,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: Get.back,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Dimens.boxHeight10,
            Padding(
              padding: Dimens.edgeInsets12_0_12_0,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      body!,
                      style: TextStyle(
                        fontSize: Dimens.twenty,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(child: SvgPicture.asset(image!))
                ],
              ),
            ),
            Dimens.boxHeight20,
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      onTap!();
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        padding: Dimens.edgeInsets8,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(.2),
                            width: 2,
                          ),
                          color: ColorsValue.whiteColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'yes'.tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Dimens.boxWidth10,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      onTapCancle!();
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        padding: Dimens.edgeInsets8,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(.2),
                            width: 2,
                          ),
                          color: ColorsValue.whiteColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'no'.tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  
  }

  static void sendFlutterErrorToast(String? message) {
    Fluttertoast.showToast(
      msg: message ?? 'Toast Failed',
      toastLength: Toast.LENGTH_LONG,
      gravity: GetPlatform.isMobile ? ToastGravity.BOTTOM : ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorsValue.redColor,
      textColor: Colors.white,
      fontSize: Dimens.sixteen,
      webBgColor: 'linear-gradient(to right, #ff4b4b, #ff4b4b)',
    );
  }
}
