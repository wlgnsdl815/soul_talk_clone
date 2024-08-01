import 'package:get/get.dart';
import 'package:soul_talk_clone/utils/navigation/app_routes.dart';
import 'package:soul_talk_clone/views/pages/main_page.dart';
import 'package:soul_talk_clone/views/pages/sign_up_page.dart';
import 'package:soul_talk_clone/views/pages/splash_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpPage(),
    ),
  ];
}
