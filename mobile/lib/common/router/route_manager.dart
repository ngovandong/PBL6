import 'package:get/route_manager.dart';
import 'package:mobile/modules/home/bindings/home.binding.dart';
import 'package:mobile/modules/home/views/home.view.dart';
import 'package:mobile/modules/login/bindings/login.binding.dart';
import 'package:mobile/modules/login/views/login.view.dart';
import 'package:mobile/modules/welcome/views/onboard.view.dart';
import 'package:mobile/modules/welcome/views/splash.view.dart';

abstract class RouteManager {
  static const String splash = '/splash';
  static const String onboard = '/onboard';
  static const String login = '/login';
  static const String home = '/home';

  static List<GetPage> pages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: splash, page: () => const OnboardScreen()),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
