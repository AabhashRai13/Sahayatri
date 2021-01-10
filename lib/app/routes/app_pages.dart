import 'package:get/get.dart';

import 'package:sahayatri/app/modules/home/bindings/home_binding.dart';
import 'package:sahayatri/app/modules/home/views/home_view.dart';
import 'package:sahayatri/app/modules/login/bindings/login_binding.dart';
import 'package:sahayatri/app/modules/login/views/login_view.dart';
import 'package:sahayatri/app/modules/registration_page/bindings/registration_page_binding.dart';
import 'package:sahayatri/app/modules/registration_page/views/registration_page_view.dart';
import 'package:sahayatri/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:sahayatri/app/modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION_PAGE,
      page: () => RegistrationPageView(),
      binding: RegistrationPageBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
  ];
}
