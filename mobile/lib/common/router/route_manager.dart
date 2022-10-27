import 'package:get/route_manager.dart';
import 'package:mobile/modules/auth/login/bindings/login.binding.dart';
import 'package:mobile/modules/auth/login/views/login.view.dart';
import 'package:mobile/modules/auth/sign_up/bindings/sign_up.binding.dart';
import 'package:mobile/modules/auth/sign_up/views/sign_up.view.dart';
import 'package:mobile/modules/home/bindings/home.binding.dart';
import 'package:mobile/modules/home/views/choose_rom.view.dart';
import 'package:mobile/modules/home/views/hotel_detail.view.dart';
import 'package:mobile/modules/home/views/pick_destination.view.dart';
import 'package:mobile/modules/home/views/search_hotels.view.dart';
import 'package:mobile/modules/profile/bindings/profile.binding.dart';
import 'package:mobile/modules/profile/presentation/views/profile.view.dart';
import 'package:mobile/modules/root/bindings/root.binding.dart';
import 'package:mobile/modules/root/views/root.view.dart';
import 'package:mobile/modules/welcome/bindings/welcome.binding.dart';
import 'package:mobile/modules/welcome/views/splash.view.dart';

abstract class RouteManager {
  static const String splash = '/splash';
  static const String onboard = '/onboard';
  static const String login = '/login';
  static const String signUp = '/sign_up';
  static const String root = '/root';
  static const String searchHotel = '/search_hotel';
  static const String pickDestination = '/pick_destination';
  static const String hotelDetail = '/hotel_detail';
  static const String chooseRoom = '/choose_room';
  static const String profile = '/profile';

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
      bindings: [RootBinding(), HomeBinding(), ProfileBinding()],
    ),
    GetPage(
      name: searchHotel,
      page: () => const SearchHotelScreen(),
    ),
    GetPage(
      name: pickDestination,
      page: () => const PickDestinationScreen(),
    ),
    GetPage(
      name: hotelDetail,
      page: () => const HotelDetailScreen(),
    ),
    GetPage(
      name: chooseRoom,
      page: () => const ChooseRoomScreen(),
    ),
    GetPage(
      name: profile,
      page: () => const ProfileScreen(),
    )
  ];
}
