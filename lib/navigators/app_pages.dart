import 'package:get/get.dart';
import 'package:laxminarayan_portfolio/pages/pages.dart';
import 'package:laxminarayan_portfolio/pages/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static var transistionDuration = const Duration(milliseconds: 350);

  static const initial = Routes.splash;
  // static const initial = Routes.home;

  static final pages = [
    GetPage(
      name: _Paths.splash,
      transitionDuration: transistionDuration,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    // GetPage(
    //   name: _Paths.home,
    //   transitionDuration: transistionDuration,
    //   page: () => const HomeView(),
    //   binding: HomeBinding(),
    //   transition: Transition.fadeIn,
    // ),
    // GetPage(
    //   name: _Paths.onBoarding,
    //   transitionDuration: transistionDuration,
    //   page: () => const OnBoardingView(),
    //   binding: OnBoardingBinding(),
    //   transition: Transition.fadeIn,
    // ),
    // GetPage(
    //   name: _Paths.signIn,
    //   transitionDuration: transistionDuration,
    //   page: () => SigninView(),
    //   binding: SigninSignupBinding(),
    //   transition: Transition.fadeIn,
    // ),
    // GetPage(
    //   name: _Paths.signUp,
    //   transitionDuration: transistionDuration,
    //   page: () => SignupView(),
    //   binding: SigninSignupBinding(),
    //   transition: Transition.fadeIn,
    // ),
  ];
}
