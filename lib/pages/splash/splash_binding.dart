import 'package:get/instance_manager.dart';
import 'package:laxminarayan_portfolio/pages/pages.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }

}