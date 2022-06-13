part of 'app_pages.dart';

abstract class Routes {
  static const splash = _Paths.splash;
  static const home = _Paths.home;
  static const onBoarding = _Paths.onBoarding;
  static const signIn = _Paths.signIn;
  static const signUp = _Paths.signUp;
  static const forgetPassword = _Paths.forgetPassword;
  static const resetPassword = _Paths.resetPassword;
}

abstract class _Paths {
  static const splash = '/splash-screen';
  static const home = '/home-view';
  static const onBoarding = '/onBoarding';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const forgetPassword = '/forgetPassword';
  static const resetPassword = '/resetPassword';
}
