import 'package:get/route_manager.dart';
import 'package:mobile/modules/auth/login/bindings/login.binding.dart';
import 'package:mobile/modules/auth/login/views/login.view.dart';
import 'package:mobile/modules/auth/sign_up/bindings/sign_up.binding.dart';
import 'package:mobile/modules/auth/sign_up/views/sign_up.view.dart';
import 'package:mobile/modules/home/bindings/home.binding.dart';
import 'package:mobile/modules/root/bindings/root.binding.dart';
import 'package:mobile/modules/root/views/root.view.dart';
import 'package:mobile/modules/welcome/bindings/welcome.binding.dart';
import 'package:mobile/modules/welcome/views/splash.view.dart';

abstract class RouteManager {
  static const String splash = '/splash';
  static const String onboard = '/onboard';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String root = '/root';

  static List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: signUp,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: root,
      page: () => const RootScreen(),
      bindings: [RootBinding(), HomeBinding()],
    ),
  ];
}
