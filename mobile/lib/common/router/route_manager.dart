import 'package:get/route_manager.dart';
import 'package:mobile/modules/auth/bindings/auth.binding.dart';
import 'package:mobile/modules/auth/views/auth.view.dart';
import 'package:mobile/modules/auth/views/fill_email.view.dart';
import 'package:mobile/modules/booking_history/bindings/booking_history.binding.dart';
import 'package:mobile/modules/booking_history/views/detail_booking_history.view.dart';
import 'package:mobile/modules/booking_history/views/find_booking_history.view.dart';
import 'package:mobile/modules/home/bindings/home.binding.dart';
import 'package:mobile/modules/hotel_detail/bindings/hotel_detail.binding.dart';
import 'package:mobile/modules/hotel_detail/views/booking_step.view.dart';
import 'package:mobile/modules/hotel_detail/views/choose_room.view.dart';
import 'package:mobile/modules/hotel_detail/views/confirm_booking.view.dart';
import 'package:mobile/modules/hotel_detail/views/fill_profile_info.view.dart';
import 'package:mobile/modules/hotel_detail/views/hotel_detail.view.dart';
import 'package:mobile/modules/home/views/search_location.view.dart';
import 'package:mobile/modules/profile/presentation/views/profile.view.dart';
import 'package:mobile/modules/profile/presentation/views/user_setting.view.dart';
import 'package:mobile/modules/search_hotel/bindings/search_hotel.binding.dart';
import 'package:mobile/modules/search_hotel/views/search_hotel.view.dart';
import 'package:mobile/modules/profile/bindings/profile.binding.dart';
import 'package:mobile/modules/root/bindings/root.binding.dart';
import 'package:mobile/modules/root/views/root.view.dart';
import 'package:mobile/modules/welcome/bindings/welcome.binding.dart';
import 'package:mobile/modules/welcome/views/splash.view.dart';

abstract class RouteManager {
  static const String splash = '/splash';
  static const String onboard = '/onboard';
  static const String auth = '/auth';
  static const String fillEmailView = '/fill_email_view';
  static const String root = '/root';
  static const String searchHotel = '/search_hotel';
  static const String searchLocation = '/search_location';
  static const String hotelDetail = '/hotel_detail';
  static const String chooseRoom = '/choose_room';
  static const String fillProfileInfo = '/fill_profile_info';
  static const String bookingStep = '/booking_step';
  static const String confirmBooking = '/confirm_booking';
  static const String detailBookingHistory = '/detail_booking_history';
  static const String profile = '/profile';
  static const String userSetting = '/user_setting';
  static const String findBookingHistory = '/find_booking_history';

  static List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: auth,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: fillEmailView,
      page: () => const FillEmailView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: root,
      page: () => const RootScreen(),
      bindings: [
        RootBinding(),
        HomeBinding(),
        BookingHistoryBinding(),
        ProfileBinding()
      ],
    ),
    GetPage(
      name: findBookingHistory,
      page: () => const FindBookingHistoryView(),
    ),
    GetPage(
      name: searchHotel,
      page: () => const SearchHotelView(),
      binding: SearchHotelBinding(),
    ),
    GetPage(
      name: searchLocation,
      page: () => const SearchDestinationView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: hotelDetail,
      page: () => const HotelDetailScreen(),
      binding: HotelDetailBinding(),
    ),
    GetPage(
      name: chooseRoom,
      page: () => const ChooseRoomView(),
      binding: HotelDetailBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: fillProfileInfo,
      page: () => const FillProfileInfoView(),
      binding: HotelDetailBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: bookingStep,
      page: () => BookingStepView(),
      binding: HotelDetailBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: confirmBooking,
      page: () => ConfirmBookingView(),
      binding: HotelDetailBinding(),
    ),
    GetPage(
      name: detailBookingHistory,
      page: () => const DetailBookingHistoryView(),
    ),
    GetPage(
      name: profile,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: userSetting,
      page: () => const UserSettingView(),
      binding: ProfileBinding(),
    )
  ];
}
