// coverage:ignore-file

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '../../utils/strings/string_constants.dart';

/// A service which will be used to handle the basic
/// operations in the application. This will be used to separate the UI related
/// work like controllers, permission and etc.<
///
/// The codes which are commented as coverage:ignore-start for them
/// the test codes are not needed as of now. So as the application grows and
/// the code are used then we will remove the ignore statement.
class CommonService extends GetxController {
  // /// initialize Device plugin
  // Future<CommonService> init({bool isTest = false}) async {
  //   onInit();
  //   deviceInfoPlugin = DeviceInfoPlugin();
  //   if (isTest) {
  //     Hive.init('HIVE_TEST');
  //     await Hive.openBox<dynamic>(StringConstants.appName);
  //   } else {
  //     await Hive.initFlutter();
  //     await Hive.openBox<dynamic>(
  //       StringConstants.appName,
  //     );
  //   }
  //   return this;
  // }

  /// Returns the box in which the data is stored.
  Box _getBox() => Hive.box<dynamic>(StringConstants.appName);

  void saveValue(dynamic key, dynamic value) async {
    await Hive.openBox<dynamic>(
      StringConstants.appName,
    );
    _getBox().put(key, value);
  }

  Future<dynamic> getValue(dynamic key) async {
    await Hive.openBox<dynamic>(
      StringConstants.appName,
    );
    return _getBox().get(key);
  }

  void clearData(dynamic key) async {
    await Hive.openBox<dynamic>(
      StringConstants.appName,
    );
    _getBox().delete(key);
  }

  void deleteBox() async {
    await Hive.openBox<dynamic>(
      StringConstants.appName,
    );
    Hive.box<void>(StringConstants.appName).clear();
  }

  /// initialize Device plugin
  var deviceInfoPlugin = DeviceInfoPlugin();

  @override
  void onInit() async {
    deviceInfoPlugin = DeviceInfoPlugin();
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(
      StringConstants.appName,
    );

    super.onInit();
  }
}
